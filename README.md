# Assessment Contract

The Assessment contract is a simple Solidity smart contract that allows an owner to manage a balance, including depositing and withdrawing funds. It includes security measures to ensure that only the owner can perform certain actions and checks to maintain the integrity of the balance.



# Prerequisites
Solidity ^0.8.9
# Contract Structure
# State Variables
address payable public owner: The owner of the contract, set at deployment.
uint256 private contractBalance: The current balance of the contract, private and only accessible through getter functions.
# Events
event Deposited(uint256 amount): Emitted when funds are deposited.
event Withdrawn(uint256 amount): Emitted when funds are withdrawn.
# Constructor
constructor(uint256 initialBalance) payable: Initializes the contract with an initial balance and sets the deployer as the owner.

# Modifiers
modifier onlyOwner(): Ensures that only the owner can call the function.

# Functions
getBalance
function getBalance() external view returns (uint256): Returns the current balance of the contract.

deposit
function deposit(uint256 amount) external payable onlyOwner: Allows the owner to deposit funds into the contract.

withdraw
function withdraw(uint256 amount) external onlyOwner: Allows the owner to withdraw funds from the contract. If the balance is insufficient, it reverts with an InsufficientFunds error.

# Error Handling
error InsufficientFunds(uint256 available, uint256 required): Custom error for handling insufficient balance scenarios.
