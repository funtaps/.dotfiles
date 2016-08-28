function gnb
    if git_is_repo
        git fetch;
        git checkout origin/master;
        git checkout -b $argv;
    end
end
