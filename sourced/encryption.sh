#!/bin/bash
# Encryption/Decryption using "Advanced Encryption Standard" (AES) with a 256 bit key

encrypt() {
	out_path="$1"".enc";
	if [[ -d $1 ]]; then
		out_path="$1"".dir.enc";
		tar -czv "$1" | openssl aes-256-cbc -out "$out_path";
	elif [[ -f $1 ]]; then
		out_path="$1"".enc";
		openssl aes-256-cbc -in "$1" -out "$out_path";
	fi
}

decrypt() {
	if [[ $1 == *.dir.enc ]]; then
		openssl aes-256-cbc -d -in "$1" | tar -xzv;
	elif [[ $1 == *.enc ]]; then
		out_path=$(echo $1 | sed -e "s/.enc$//");
		openssl aes-256-cbc -d -in "$1" -out "$out_path";
	fi
}
