#!/usr/bin/env bash

exit_code=0;

echo -e "+--------------------------+";
echo -e "| Jenkins master container |";
echo -e "+--------------------------+\n";

echo -e "\nPull config from repository...\n";
cd /root/jenkins;
    git pull;
    if [[ "${?}" != 0 ]]; then
        exit 1;
    fi;
cd -;

echo -e "\nStart Jenkins service...\n";
/usr/local/bin/jenkins.sh;
