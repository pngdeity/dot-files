#!/bin/bash

current=$(date +%s)
end=$(date -d "16 May" +%s)
let remain=$(((end-current)/86400))
echo $remain days until THE END
