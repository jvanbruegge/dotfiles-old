#!/bin/bash

for d in ${pwd}; do
    if [ -e "$d/install.sh" ]; then
        $d/install.sh
    fi
done
