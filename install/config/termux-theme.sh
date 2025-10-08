#!/usr/bin/env bash

ds "Changing Termux look and feel..."

echo "extra-keys = [['ESC','ALT','CTRL','TAB','LEFT','DOWN','UP','RIGHT']]" >> ~/.termux/termux.properties

cp -r $NIX_PATH/configs/termux/* ~/.termux/
