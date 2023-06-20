#!/bin/sh

find /Library/LaunchAgents -name '*zscaler*' -exec launchctl unload {} \;
sudo find /Library/LaunchDaemons -name '*zscaler*' -exec launchctl unload {} \;

find /Library/LaunchAgents -name '*carbon*' -exec launchctl unload {} \;
sudo find /Library/LaunchDaemons -name '*carbon*' -exec launchctl unload {} \;
