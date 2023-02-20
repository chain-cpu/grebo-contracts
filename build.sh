#!/bin/bash
contracts=("ft" "nft" "test-approval-receiver" "test-token-receiver")

for contract in "${contracts[@]}"
do
	echo "bulding $contract contract..." 
	cd $contract && cargo build --all --target wasm32-unknown-unknown --release
	cd ..
	echo "moving $contract wasm file to res folder..."
	cp ./$contract/target/wasm32-unknown-unknown/release/*.wasm ./res/$contract.wasm
done

