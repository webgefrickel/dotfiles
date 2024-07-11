#!/usr/bin/env zsh

take () { # shortcut for creating and going into dir
  mkdir -p $1
  cd $1
}

# terminal weather shortcut
wttr () {
  if [[ -n "$1" ]]
    then 
      curl "wttr.in/$1?format=v2"
    else 
      curl "wttr.in/Leipzig?format=v2"
  fi
}

# function for easily converting a video for web
webvideo () {
  if [ $# -eq 0 ]; then
    echo "No arguments supplied, example usage: webvideo FILENAME --resize 1920 --mute"
  else
    zparseopts -E -D -- -resize:=opt_resize -mute=opt_mute

    file=$(basename -- "$1")
    extension="${file##*.}"
    filename="${file%.*}"
    width="${opt_resize[2]}"
    w="${width:-trunc(iw/2)*2}"
    h="trunc(ih/2)*2"

    if [[ -n "$width" ]]
    then
      h="trunc(ow/a/2)*2"
    fi

    scale="scale=$w\:$h"
    ffmpeg -ss 00:00:02 -i $1 -frames:v 1 -vf $scale $filename.jpg

    if [ -z "${opt_mute}" ]; then
      ffmpeg -i $1 -map_metadata -1 -c:a copy -c:v libx264 -crf 26 -preset veryslow -profile:v main -pix_fmt yuv420p -movflags +faststart -vf $scale $filename.h264.mp4
      ffmpeg -i $1 -map_metadata -1 -c:a libopus -b:a 64k -c:v libaom-av1 -crf 50 -b:v 0 -pix_fmt yuv420p -movflags +faststart -cpu-used 8 -vf $scale $filename.av1.webm
    else
      ffmpeg -i $1 -map_metadata -1 -an -c:v libx264 -crf 26 -preset veryslow -profile:v main -pix_fmt yuv420p -movflags +faststart -vf $scale $filename.h264.mp4
      ffmpeg -i $1 -map_metadata -1 -an -c:v libaom-av1 -crf 50 -b:v 0 -pix_fmt yuv420p -movflags +faststart -cpu-used 8 -vf $scale $filename.av1.webm
    fi
  fi
}

pdf () {
  convert *.jpg -auto-orient -monochrome temp.pdf
  ocrmypdf --rotate-pages --optimize 3 --jpeg-quality 70 temp.pdf document.pdf
  rm temp.pdf
}

# fancy vim/shell switch with ctrl-z (see zshrc)
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}

# easy vim/terminal switch after loading zsh-functions
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
