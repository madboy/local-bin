#!/bin/bash

for package in "user2" "payment-common" "payment-discount" "payment-history";  do
    pushd $HOME/virtualenvs/spotify/src/$package;
    python setup.py build_protobuf;
    popd;
done
