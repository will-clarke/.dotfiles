function escape_special_characters
    set -l input_string $argv[1]

    # Replace double quotes with escaped double quotes
    set input_string (string replace -a '"' '\"' $input_string)

    # Add escaped double quotes at the beginning and end of the string
    echo "\"$input_string\""
end
