#!/bin/bash

now=$(date)
cd ~/Documents/tmp

cat > "$now".txt <<- "EOF"
## General Tests

## Behavioral Tests

## Conclusion
EOF

vim "$now".txt
