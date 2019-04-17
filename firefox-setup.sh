#!/bin/bash

# This script opens Firefox with a specified list of tabs.
# In my case, the tabs are those I check for updates, e.g. Facebook Messenger, online email, etc.

firefox $(cat /home/nathan/Documents/firefox-tab-list.txt | tr '\n' ' ') &
