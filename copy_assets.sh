#!/bin/bash
ASSETS_DIR="/Volumes/m2/appleapp/liulei/426/潮州菜菜谱精选/潮州菜菜谱精选/潮州菜菜谱精选/Assets.xcassets"

declare -A map=(
["braised_goose"]="潮州卤鹅"
["braised_pig_trotters"]="卤水猪手"
["braised_platter"]="卤水拼盘"
["baked_crab_with_soy_paste"]="豆酱焗青蟹"
["steamed_fish_chaozhou_style"]="潮式清蒸鱼"
["stir_fried_thin_shells_with_basil"]="金不换炒薄壳"
["seafood_casserole_porridge"]="海鲜砂锅粥"
["raw_pickled_blood_clams"]="生腌血蚶"
["raw_pickled_mantis_shrimp"]="生腌虾蛄"
["chaozhou_oyster_omelet"]="潮州蚝烙"
["handmade_beef_balls"]="手捶牛肉丸"
["red_peach_kueh"]="红桃粿"
["kueh_chap"]="粿汁"
["pumpkin_taro_paste"]="金瓜芋泥"
["sugar_coated_taro"]="反沙芋"
["duck_mother_twist"]="鸭母捻"
)

SRC_DIR="/Users/ll/.gemini/antigravity/brain/07e93cbf-f188-45da-9096-33de6a1f7d12"

for file in "$SRC_DIR"/*.png; do
    filename=$(basename "$file")
    base=$(echo "$filename" | sed -E 's/_[0-9]+\.png$//')
    
    if [[ -n "${map[$base]}" ]]; then
        recipe_name="${map[$base]}"
        img_set="$ASSETS_DIR/$recipe_name.imageset"
        mkdir -p "$img_set"
        cp "$file" "$img_set/$recipe_name.png"
        
        cat > "$img_set/Contents.json" <<INNER_EOF
{
  "images" : [
    {
      "filename" : "$recipe_name.png",
      "idiom" : "universal"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
INNER_EOF
        echo "Copied $base as $recipe_name"
    fi
done
