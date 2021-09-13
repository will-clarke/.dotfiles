function m
   cd (git rev-parse --show-toplevel) && make $argv
   cd ..
end
