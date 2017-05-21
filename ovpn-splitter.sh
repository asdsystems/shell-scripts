#!/bin/bash

input=$1

if [ ! -r "${input}" ]; then
	echo "can't read ${input}"
	exit 1
fi

function export-section {
	input=$1
	output=$2
	section=$3
	sed -n -e "/<${section}>/,\$p" "${input}" | sed -e "/<\/${section}>/,\$d" | sed '1,1d' > "${output}"
}

export-section "${input}" ca.crt ca
export-section "${input}" client.crt cert
export-section "${input}" client.key key

exit 0