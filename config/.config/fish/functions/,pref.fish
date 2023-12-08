function ,prev
    cd ../"$(ls -F .. | grep '/' | grep -B1 -xF "{PWD##*/}/" | tail -n 1)"
end
