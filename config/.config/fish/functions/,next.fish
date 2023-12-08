function ,next
    cd ../"$(ls -F .. | grep '/' | grep -A1 -xF "{PWD##*/}/" | tail -n 1)"
end
