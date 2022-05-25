#!/usr/bin/env bash

# Read the mumbai RPC URL
echo Enter Your mumbai RPC URL:
echo Example: "https://eth-mumbai.alchemyapi.io/v2/XXXXXXXXXX"
read -s rpc

# Read the contract path
echo Where is the contract path that you want to deploy file\(eg src/core/Greeter.sol\)?
read contract_path

# Read the contract name
echo Which contract do you want to deploy \(eg Greeter\)?
read contract

# Read the constructor arguments
echo Enter constructor arguments separated by spaces \(eg nothing or address balance\):
read -ra args

# Read the deployyment private key
echo Enter private key for deployment \(eg xxxxXXXXXXXXx\):
read -ra private_key

if [ -z "$args" ]
then
  echo forge create ${contract_path}:${contract} -i --rpc-url $rpc
  forge create ${contract_path}:${contract} -i --rpc-url $rpc --private-key ${private_key}
else
  echo forge create ${contract_path}:${contract} -i --rpc-url $rpc --constructor-args ${args}
  forge create ${contract_path}:${contract} -i --rpc-url $rpc --constructor-args ${args} --private-key ${private_key}
fi