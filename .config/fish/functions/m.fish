function m
   set wd $PWD
   cd (git rev-parse --show-toplevel) && make $argv && cd -
   cd $wd
end
