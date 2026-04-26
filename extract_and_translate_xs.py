import os
import re
import json
import time
from deep_translator import GoogleTranslator

lang_mapping = {
    "ar": "ar", "bn": "bn", "bg": "bg", "ca": "ca", "zh-HK": "zh-TW",
    "zh-TW": "zh-TW", "hr": "hr", "cs": "cs", "da": "da", "nl": "nl", "en": "en", "fr": "fr",
    "de": "de", "ko": "ko", "ru": "ru", "pt-PT": "pt", "pt-BR": "pt",
    "es": "es", "it": "it", "hi": "hi", "th": "th", "vi": "vi",
    "id": "id", "el": "el", "fi": "fi", "sv": "sv", "tr": "tr",
    "pl": "pl", "ro": "ro", "uk": "uk", "hu": "hu", "ms": "ms",
    "ja": "ja", "sk": "sk"
}

workspace_dir = "."
xcstrings_path = os.path.join(workspace_dir, "潮州菜菜谱精选", "Localizable.xcstrings")
if not os.path.exists(xcstrings_path):
    xcstrings_path = os.path.join(workspace_dir, "Localizable.xcstrings")

strings_found = set()

pattern = re.compile(r'"([^"\\]*(?:\\.[^"\\]*)*[\u4e00-\u9fa5]+[^"\\]*(?:\\.[^"\\]*)*)"')

for root, _, files in os.walk(workspace_dir):
    for f in files:
        if f.endswith(".swift"):
            filepath = os.path.join(root, f)
            with open(filepath, 'r', encoding='utf-8') as src:
                content = src.read()
                matches = pattern.findall(content)
                for m in matches:
                    clean_match = re.sub(r'\\\([^)]*\)', '%@', m)
                    strings_found.add(clean_match)

print(f"Extracted {len(strings_found)} base strings.")

extras = [
    "潮州菜菜谱精选", "搜索", "收藏", "菜谱", "难度", "简单", "中等", "困难"
]
for e in extras:
    strings_found.add(e)

if os.path.exists(xcstrings_path):
    with open(xcstrings_path, 'r', encoding='utf-8') as f:
        catalog = json.load(f)
else:
    catalog = {"sourceLanguage": "zh-Hans", "strings": {}, "version": "1.1"}

catalog["sourceLanguage"] = "zh-Hans"

if "strings" not in catalog:
    catalog["strings"] = {}

for key in strings_found:
    if key not in catalog["strings"]:
        catalog["strings"][key] = {
            "extractionState": "manual",
            "localizations": {}
        }

keys_to_translate = list(catalog["strings"].keys())
total_langs = len(lang_mapping)
chunk_size = 50

print(f"Starting translation of {len(keys_to_translate)} keys into {total_langs} languages...")

for xcode_lang, gt_lang in lang_mapping.items():
    print(f"Translating to {xcode_lang} ({gt_lang})...")
    for i in range(0, len(keys_to_translate), chunk_size):
        chunk = keys_to_translate[i:i+chunk_size]
        needs_translation = False
        for k in chunk:
            if xcode_lang not in catalog["strings"][k].get("localizations", {}):
                needs_translation = True
                break
        if not needs_translation: continue
            
        try:
            text_to_translate = " \n~|~ \n".join(chunk)
            temp_text = text_to_translate.replace("%@", " X_VAR_X ")
            result = GoogleTranslator(source='zh-CN', target=gt_lang).translate(temp_text)
            result = result.replace("X_VAR_X", "%@").replace(" X_VAR_X ", "%@").replace("X _ VAR _ X", "%@")
            splits = [s.strip() for s in result.split("~|~")]
            
            if len(splits) == len(chunk):
                for idx, k in enumerate(chunk):
                    if "localizations" not in catalog["strings"][k]:
                        catalog["strings"][k]["localizations"] = {}
                    catalog["strings"][k]["localizations"][xcode_lang] = {
                        "stringUnit": {
                            "state": "translated",
                            "value": splits[idx].replace("% @", "%@")
                        }
                    }
            else:
                for k in chunk:
                    if xcode_lang not in catalog["strings"][k].get("localizations", {}):
                        t_k = k.replace("%@", " X_VAR_X ")
                        res = GoogleTranslator(source='zh-CN', target=gt_lang).translate(t_k)
                        res = res.replace("X_VAR_X", "%@").replace(" X_VAR_X ", "%@").replace("X _ VAR _ X", "%@")
                        res = res.replace("% @", "%@")
                        
                        if "localizations" not in catalog["strings"][k]:
                            catalog["strings"][k]["localizations"] = {}
                        catalog["strings"][k]["localizations"][xcode_lang] = {
                            "stringUnit": {
                                "state": "translated",
                                "value": res
                            }
                        }
        except Exception as e:
            print(f"Error for {xcode_lang} chunk: {e}")
            time.sleep(1)

with open(xcstrings_path, 'w', encoding='utf-8') as f:
    json.dump(catalog, f, indent=2, ensure_ascii=False)

print("Translations generated.")

pbxproj_path = os.path.join(workspace_dir, "潮州菜菜谱精选.xcodeproj", "project.pbxproj")
with open(pbxproj_path, "r", encoding="utf-8") as f:
    lines = f.readlines()

new_lines = []
in_known_regions = False
for line in lines:
    if "knownRegions = (" in line:
        in_known_regions = True
        new_lines.append(line)
        for code in lang_mapping.keys():
            new_lines.append(f"\t\t\t\t{code},\n")
        continue

    if in_known_regions:
        if ");" in line:
            in_known_regions = False
            new_lines.append(line)
    else:
        new_lines.append(line)

with open(pbxproj_path, "w", encoding="utf-8") as f:
    f.writelines(new_lines)

print("pbxproj updated.")
