# Space Contracts

This project contains the Smart Contrats for the Space, which is used to deploy a NFT campaign contract.

# Running Locally

Clone the repo locally
```shell

git clone https://github.com/VIVEK-SUTHAR/space-contracts
cd space-contracts
```

Install dependencies

```shell
yarn
#or
npm i

```

Add environment variable

```shell
PRIVATE_KEY=ACCOUNT_TO_DEPLOY_PRIVATE_KEY
POLYGONSCAN_API_KEY=FOR_AUTOMATIC_CVERIFICATION
TESTNET_RPC=RPC_URL
```

Deploy contract:
Run below script to deploy the contract, it will deploy and verify the contract

```shell
npx hardhat run scripts/deploy.ts --network mumbai
```

npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.ts

```

```
