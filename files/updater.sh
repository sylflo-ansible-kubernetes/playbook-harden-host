#!/bin/bash
#
# apt-get updater script for cron automatization
# This script is released under the BSD 3-Clause License.

set -e 

echo
echo "############################"
echo "Starting apt-get-autoupdater"
date
echo
apt update
apt --fix-broken install
apt --yes upgrade
apt-get autoremove
apt-get clean
apt-get autoclean
echo "Finished to update system"
