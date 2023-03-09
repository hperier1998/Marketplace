# Marketplace
This is a Solidity project is for a smart contract that could be used in an online marketplace.

## Contributors
1. Hadrien PERIER (Github name : hperier1998)

## Project Descrption
The smart contract is used to track the status of items purchased from an online marketplace. 

When the contract is created, the shipping status is set to Pending. 

When an item is shipped, the shipping status is set to Shipped and an event is emitted. 

Upon delivery, the item's shipping status is set to Delivered and another event is emitted.

The project has the following elements :
1. An enum list to define the shipping statuses: Pending, Shipped, Delivered.
2. A private state variable to store the current shipping status. 
3. A constructor for the smart contract deployment.
4. An event that is triggered when the shipping status changes.
5. 2 modifiers to limit access rights to functions: ownerOnly and customerOnly.
6. Various functions with securities : 
     - Function shipped() - Changes the current shipping status to 'shipped'. Only the contract owner can call this.
     - Function delivered() - Changes the current shipping status to 'delivery'. Only the contract owner can call this.
     - Function getStatus() - Returns the current shipping status. Only the contract owner can call this.
     - Function checkStatus() - Returns the current shipping status but requires a pay fee. Only the contract customer can call this.
     - Function convertStatusToString() - Returns the shipping status as string.
7. Contract deployed on Mumbai.

## Deployed Smart Contract
This is the link to the deployed smart contract:
https://mumbai.polygonscan.com/address/0x59a69891ed8c95978c2054124b5bf360ca5f69fc

## Documentations:
Truffle deploy on Mumbai : https://wiki.polygon.technology/docs/develop/truffle/
