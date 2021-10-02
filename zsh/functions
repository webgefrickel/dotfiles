# TERMINAL INTEGRATIONS
l () {
  if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
    echo "nnn is already running"
    return
  fi

  export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

  nnn "$@"

  if [ -f "$NNN_TMPFILE" ]; then
    . "$NNN_TMPFILE"
    rm -f "$NNN_TMPFILE" > /dev/null
  fi
}

# s as in 'show' / quicklook script
s () {
  trap 'exit 0' 2 #traps Ctrl-C (signal 2)
  qlmanage -p $1 >& /dev/null
}

take () {
  mkdir -p $1
  cd $1
}

current_branch () {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}

# CUSTOM FUNCTIONS
wttr () {
  if [[ -n "$1" ]]
    then 
      curl "wttr.in/$1?format=v2"
    else 
      curl "wttr.in/Leipzig?format=v2"
  fi
}

webvideo () {
  WIDTH="${2:-trunc(iw/2)*2}"
  HEIGHT="trunc(ih/2)*2"
  if [[ -n "$2" ]]
  then
    HEIGHT="trunc(ow/a/2)*2"
  fi

  SCALE="scale=$WIDTH\:$HEIGHT"

  ffmpeg -i $1 -map_metadata -1 -c:a libfdk_aac -b:a 96k -c:v libx264 -crf 26 -preset slow -profile:v main -pix_fmt yuv420p -movflags +faststart -vf $SCALE -threads 0 $1.h264.mp4
  ffmpeg -i $1 -map_metadata -1 -c:a libopus -b:a 64k -c:v librav1e -qp 110 -speed 4 -tile-columns 2 -tile-rows 2 -movflags +faststart -vf $SCALE -threads 0 $1.av1.webm
}

webvideomute () {
  WIDTH="${2:-trunc(iw/2)*2}"
  HEIGHT="trunc(ih/2)*2"
  if [[ -n "$2" ]]
  then
    HEIGHT="trunc(ow/a/2)*2"
  fi

  SCALE="scale=$WIDTH\:$HEIGHT"

  ffmpeg -i $1 -map_metadata -1 -an -c:v libx264 -crf 26 -preset slow -profile:v main -pix_fmt yuv420p -movflags +faststart -vf $SCALE -threads 0 $1.h264.mp4
  ffmpeg -i $1 -map_metadata -1 -an -c:v librav1e -qp 110 -speed 4 -tile-columns 2 -tile-rows 2 -movflags +faststart -vf $SCALE -threads 0 $1.av1.webm
}

webvideoposter () {
  ffmpeg -ss 00:00:02 -i $1 -frames:v 1 $1.jpg
}

webgallery () {
  mogrify -format jpg -resize '47.6190476%' -strip -quality 75 *.HEIC
  rm *.HEIC
}
