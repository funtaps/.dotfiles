function convert_to_submodule
    cd $argv;
    set gremote (git remote show -n origin | grep github | grep -o 'http.*$' | head -n 1);
    cd ..;
    rm -rf $argv;
    git submodule add $gremote $argv
end
