function jsonify
    echo -n "{"
    set -l len (count $argv)
    for idx in (seq $len)
        set var $argv[$idx]
        set val (eval "echo -n \$$var")
        echo -n "\"$var\": \"$val\""
        if test $idx -ne $len
            echo -n ","
        end
    end
    echo -n "}"
end
