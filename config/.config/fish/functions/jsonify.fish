function jsonify
    echo "{"
    set -l len (count $argv)
    for idx in (seq $len)
        set var $argv[$idx]
        set val (eval "echo \$$var")
        echo -n "\"$var\": \"$val\""
        if test $idx -ne $len
            echo -n ","
        end
        echo
    end
    echo "}"
end
