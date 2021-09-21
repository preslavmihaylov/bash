#/bin/bash
#
# A script for transforming all .mov files in the current dir to .mp4 using ffmpeg

mkdir tmp || true
for i in $(ls | grep '\.mov'); do
    BASEFILE=${i%.*}

    ffmpeg -i $i -vcodec h264 -acodec mp2 $BASEFILE.mp4
    mv $i tmp/$i
done
