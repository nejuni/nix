#!/usr/bin/env bash

ds "Post-install Setup..."

# Not in use only using one for dir setup only

# dir script
run $NIX_INSTALL/setup/dir.sh

# rsync script
run $NIX_INSTALL/setup/rsync.sh





