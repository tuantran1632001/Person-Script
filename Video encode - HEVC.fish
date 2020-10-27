#! /usr/bin/fish

set CRF 25
set PRESET medium

for i in *.mp4 *.ts *.mkv *.m4v *.avi *.mov *.wmv *.m2ts *.mts *.flv
    set filename $i
    set rootname (echo $filename | sed 's/\.[^.]*$//')
    ffmpeg -i "$filename" -c:v hevc -crf $CRF -preset $PRESET -c:a aac -b:a 320k -n $rootname_$CRF_$PRESET.mp4
end
