
### Fix Kazam codec issue
fix_kazam () {
	local fin=$(echo "$1" | cut -f 1 -d '.')
	local fout=${fin}_out

	ffmpeg -y -i ${fin}.mp4 -c:v libx264 -c:a aac -strict experimental -tune fastdecode -pix_fmt yuv420p -b:a 192k -ar 48000 ${fout}.mp4
}

### Archive Extraction
# Usage : ex <file>
ex () {
    if [[ -f $1 ]]; then
        case $1 in
            *.tar.bz2)    tar xjf $1    ;;
            *.tar.gz)     tar xvzf $1   ;;
            *.bz2)        bunzip2 $1    ;;
            *.rar)        unrar x $1    ;;
            *.gz)         gunzip $1     ;;
            *.tar)        tar xf $1     ;;
            *.tbz2)       tar xjf $1    ;;
            *.tgz)        tar xzf $1    ;;
            *.zip)        unzip $1      ;;
            *.Z)          uncompress $1 ;;
            *.7z)         7z x $1       ;;
            *.deb)        ar x $1       ;;
            *.tar.xz)     tar xf $1     ;;
            *.tar.zst)    unzstd $1     ;;
            *)            echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
