function ,prev
    cd ../"$(ls -F .. | grep '/' | grep -B1 (basename $PWD) | tail -n 1)"
end
