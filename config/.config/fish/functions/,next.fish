function ,next
    cd ../(ls -F .. | grep '/' | grep -A1 (basename $PWD) | tail -n 1)
end
