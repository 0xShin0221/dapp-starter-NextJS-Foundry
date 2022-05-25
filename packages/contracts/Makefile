# include .env file and export its env vars
# (-include to ignore error if it does not exist)
-include .env

all: clean remove install update build 

# Clean the repo
clean: forge clean

# Remove modules
remove: rm -rf .gitmodules && rm -rf .git/modules/* && rm -rf lib && touch .gitmodules && git add . && git commit -m "modules"

# Install the Modules
install:
	forge install dapphub/ds-test 
	forge install OpenZeppelin/openzeppelin-contracts
	forge install brockelmore/forge-std
	forge install gnosis/safe-contracts

# Update Dependencies
update: forge update

# Builds
build:
	forge clean
	forge build --optimize --optimizer-runs 1000000

setup-pnpm: 
	pnpm i

local-node:
	npx pnpm hardhat node 

# Test
test-c:
	forge test --match  ${CONTRACT} -vvvv

test:
	forge test

test-w:
	forge test --watch --run-all -vvvv

# Specifie Contact for Deploy: contract:src/NFT.sol:NFT
deploy:
	forge create --rpc-url ${RPC_URL} --private-key ${PRIVATE_KEY} ${CONTRACT_PATH}:${CONTRACT} 

deploy-with-args:
	forge create --rpc-url ${RPC_URL} --private-key ${PRIVATE_KEY} ${CONTRACT_PATH}:${CONTRACT} --constructor-args ${CONTRACT_ARGS}

# Generate Gas Snapshots
snapshot:
	forge clean && forge snapshot --optimize --optimizer-runs 1000000

# Fork Mainnet With Hardhat
mainnet-fork:
	npx hardhat node --fork ${RPC_URL}

# Format
format:
	make format-rewrite
	make format-check

format-rewrite:
	prettier --write 'src/**/*.sol'
format-check:
	prettier --check 'src/**/*.sol'

# Lint
lint:
	npx solhint --config ./.solhint.json 'src/**/*.sol' --fix
lint-check:
	npx solhint --config ./.solhint.json 'src/**/*.sol'

# Lint & Format
lint-format:
	make lint
	make format

lint-format-check:
	make lint-check
	make format-check