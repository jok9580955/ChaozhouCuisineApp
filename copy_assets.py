import os
import shutil
import json
import glob
import re

assets_dir = "/Volumes/m2/appleapp/liulei/426/潮州菜菜谱精选/潮州菜菜谱精选/潮州菜菜谱精选/Assets.xcassets"
src_dir = "/Users/ll/.gemini/antigravity/brain/07e93cbf-f188-45da-9096-33de6a1f7d12"

name_map = {
    "braised_goose": "潮州卤鹅",
    "braised_pig_trotters": "卤水猪手",
    "braised_platter": "卤水拼盘",
    "baked_crab_with_soy_paste": "豆酱焗青蟹",
    "steamed_fish_chaozhou_style": "潮式清蒸鱼",
    "stir_fried_thin_shells_with_basil": "金不换炒薄壳",
    "seafood_casserole_porridge": "海鲜砂锅粥",
    "raw_pickled_blood_clams": "生腌血蚶",
    "raw_pickled_mantis_shrimp": "生腌虾蛄",
    "chaozhou_oyster_omelet": "潮州蚝烙",
    "handmade_beef_balls": "手捶牛肉丸",
    "red_peach_kueh": "红桃粿",
    "kueh_chap": "粿汁",
    "pumpkin_taro_paste": "金瓜芋泥",
    "sugar_coated_taro": "反沙芋",
    "duck_mother_twist": "鸭母捻"
}

for file_path in glob.glob(os.path.join(src_dir, "*.png")):
    filename = os.path.basename(file_path)
    base_match = re.match(r"(.+)_\d+\.png$", filename)
    if base_match:
        base = base_match.group(1)
        if base in name_map:
            recipe_name = name_map[base]
            img_set = os.path.join(assets_dir, f"{recipe_name}.imageset")
            os.makedirs(img_set, exist_ok=True)
            
            dest_img = os.path.join(img_set, f"{recipe_name}.png")
            shutil.copy2(file_path, dest_img)
            
            contents = {
                "images": [
                    {
                        "filename": f"{recipe_name}.png",
                        "idiom": "universal"
                    }
                ],
                "info": {
                    "author": "xcode",
                    "version": 1
                }
            }
            with open(os.path.join(img_set, "Contents.json"), "w") as f:
                json.dump(contents, f, indent=2)
                
            print(f"Copied {base} as {recipe_name}")
