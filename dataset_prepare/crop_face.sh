detectandcrop () {
BUCKET=$(printf "%04d" $(( $@ % 1000 )) )
ID="$@"
CUDA_VISIBLE_DEVICES ="0" python ~/AnimeWifeGenerator/dataset_prepare/lbpcascade_animeface/examples/detect.py \ ~/AnimeWifeGenerator/dataset_prepare/lbpcascade_animeface/lbpcascade_animeface.xml \ ~/AnimeWifeGenerator/danbooru2020/original/$BUCKET/$ID .* "~/AnimeWifeGenerator/Danbooru2020_part_dc/$ID"
}
export -f detectandcrop

mkdir ~/AnimeWifeGenerator/Danbooru2020_part_dc/
find ~/AnimeWifeGenerator/danbooru2020/original/ -type f -name "*. jpg" | parallel detectandcrop