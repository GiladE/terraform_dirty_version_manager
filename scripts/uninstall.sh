#!/bin/bash

sudo echo -n

echo -e -n "\e[1m\e[31m[download]\e[0m Deleting cached downloads ... "
rm -rf $HOME/.terraform/cache/*
echo -e "done"
echo -e -n "\e[1m\e[31m[extract ]\e[0m Deleting extracted binaries ... "
rm -rf $HOME/.terraform/bin/*
echo -e "done"
echo -e -n "\e[1m\e[31m[symlink ]\e[0m Removing symlink ... "
sudo rm "/usr/local/bin/terraform"
echo -e "done"
