function ,prev
    cd ../(ls -F .. | grep '/' | grep -B1 (basename $PWD) | head -n 1)
end
