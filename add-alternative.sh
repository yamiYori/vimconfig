#!/bin/bash

if command -v update-alternatives >/dev/null 2>&1; then
    update-alternatives --install /usr/bin/editor editor $(which vim) 100
else
    echo "update-alternatives does not exist."
fi