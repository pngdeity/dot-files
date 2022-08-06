#!/bin/sh

rate=$(curl -sf https://api.kraken.com/0/public/Ticker?pair=XETHZUSD | jq -r ".result.XETHZUSD.c[0]")
rate=$(LANG=C printf "%.2f" "$rate")
symbol=$(echo -ne '\xEE\x81\x98')
echo "$symbol $rate"
