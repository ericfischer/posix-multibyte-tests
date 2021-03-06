#!/bin/sh

LC_ALL=en_US.UTF-8
export LC_ALL

awk -F'💩'  '{ print $2 }' fixtures/awk1 > out/awk1.check
./compare awk1 "Field separator"

awk '{ print length }' fixtures/awk2 > out/awk2.check
./compare awk2 "String length"

awk 'BEGIN { print index("𝐇𝐞𝐥𝐥𝐨", "𝐨"); exit 0 }' > out/awk3.check
./compare awk3 "Index into string"

awk 'BEGIN { print substr("𝐇𝐞𝐥𝐥𝐨 𝐰𝐨𝐫𝐥𝐝", 7); exit 0 }' > out/awk4.check
./compare awk4 "Substring"

awk '{ print tolower($0) }' fixtures/awk5 > out/awk5.check
./compare awk5 "To lower case"

awk '{ print toupper($0) }' fixtures/awk5 > out/awk6.check
./compare awk6 "To upper case"
