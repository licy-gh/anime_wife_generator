upscaleimages () {
SIZE1=$(identify -format "%h" "$@")
SIZE2=$(identify -format "%w" "$@");

if (( $SIZE1 < 512 && $SIZE2 < 512)); then
    echo "$@" $SIZE
    TMP=$(mktemp "/tmp/XXXXXX.png")
    CUDA_VISIBLE_DEVICES ="0" ~/AnimeWifeGenerator/dataset_prepare/waifu2x/waifu2x.lua -model_dir \ ~/AnimeWifeGenerator/dataset_prepare/waifu2x/models/upconv_7/art -tta 1 -m scale -scale 2 \
    -i "$@" -o "$TMP"
    convert "$TMP" "$@"
    rm "$TMP"
fi;}

export -f upscaleimages
find ~/AnimeWifeGenerator/Danbooru2020_part_dc/ -type f | parallel upscaleimages