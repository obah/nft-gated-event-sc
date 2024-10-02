# NFTGatedEvent

This repository contains smart contracts for an NFT-gated event system written in Solidity. The repository uses Hardhat as development environment for compilation, testing and deployment tasks. The project uses Solidity, hardhat and implements a factory pattern for creating event contracts.

## What is NFTGatedEvent
NFTGatedEvent implements the process of granting access to events based on the ownership of ERC721 tokens (NFTS). This repo has a [factory contract](https://github.com/obah/nft-gated-event-sc/blob/main/contracts/CoolEventFactory.sol) to deploy an [Event contract](https://github.com/obah/nft-gated-event-sc/blob/main/contracts/CoolEvent.sol), hence allowing anyone to create different events gated with different NFTs. 

## Contracts Documentation & Deployments

### [CoolEvent.sol](https://github.com/obah/nft-gated-event-sc/blob/main/contracts/CoolEvent.sol)

The `CoolEvent` contract manages user registration for an event, allows the owner to mint NFTs for registered users and controls the access, duration and size for the event.

- Deployed address (Lisk Sepolia Testnet): 0x3E22255599450Ad9508Ec9ba4680be65f1Bb0132
- [Lisk Sepolia Blockscout verification link](https://sepolia-blockscout.lisk.com/address/0x3E22255599450Ad9508Ec9ba4680be65f1Bb0132#code)

Key features:
- Limits the number of guests
- Mints unique NFTs for registered users
- Prevents users from registering multiple times or using same NFT
- Allows owner to verify user registration

Functions:
- `constructor(uint40 _maxGuests, address _coolNFT)`: Initializes the contract with a maximum guest limit and the address of the CoolNFT contract.
- `registerUser(address _account, string memory _tokenURI)`: Registers a user and mints an NFT for them.
- `verifyUser(address _account)`: Checks if a user has been registered and has an NFT.
- `getUser(address _account)`: Returns the token ID for a registered user.

### CoolEventFactory.sol

The `CoolEventFactory` contract deploys new instances of the `CoolEvent` contract with a desired NFT, using the `create2` opcode.

- Deployed Address (Lisk Sepolia Testnet): 0x665E7FAa7b2e16E48B46c7965DB204B9bc02C7fF
- [Lisk Sepolia Blockscout verification link](https://sepolia-blockscout.lisk.com/address/0x665E7FAa7b2e16E48B46c7965DB204B9bc02C7fF#code)

Key features:
- Deploys new `CoolEvent` contracts
- Keeps track of deployed contract addresses
- Uses `create2` for deterministic contract addresses

Functions:
- `createCoolEvent(bytes memory _bytecode, uint256 _salt)`: Creates a new CoolEvent contract using the provided bytecode and salt.
- `getContracts()`: Returns an array of all deployed CoolEvent contract addresses.

## Setup and Installation

### Prerequisites

Ensure you have the following installed:

- Node.js
- Hardhat

### Installation

1. Clone the repository:

   ```shell
   git clone https://github.com/obah/nft-gated-event-sc.git
   cd nft-gated-event-sc
   ```

2. Install dependencies:

   ```shell
   npm install
   ```

## Usage

Setup `hardhat.config.ts` file and deploy the `CoolEventFactory` contract first, then use it to create individual `Event` instances. Interact with each `Event` using its specific address and the functions provided in the `CoolEvent` contract.

```shell
npx hardhat ignition deploy ./ignition/modules/CoolEvent.ts
```

### Note

This code is provided as-is and should be thoroughly audited before use in production environments. Ensure proper testing and security measures are in place when dealing with digital assets.

## Test

To run the tests, use:

```shell
npx hardhat test
```
