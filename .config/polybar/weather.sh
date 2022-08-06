#!/bin/bash

echo $(curl wttr.in/?0?q?T 2>/dev/null | awk '/°(C|F)/ {printf $(NF-1) $NF}')
