// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Assessment {
    address payable public owner;
    uint256 private contractBalance;

    event Deposited(uint256 amount);
    event Withdrawn(uint256 amount);

    constructor(uint256 initialBalance) payable {
        owner = payable(msg.sender);
        contractBalance = initialBalance;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    function getBalance() external view returns (uint256) {
        return contractBalance;
    }

    function deposit(uint256 amount) external payable onlyOwner {
        uint256 previousBalance = contractBalance;

        contractBalance += amount;

        assert(contractBalance == previousBalance + amount);

        emit Deposited(amount);
    }

    error InsufficientFunds(uint256 available, uint256 required);

    function withdraw(uint256 amount) external onlyOwner {
        uint256 previousBalance = contractBalance;

        if (contractBalance < amount) {
            revert InsufficientFunds(contractBalance, amount);
        }

        contractBalance -= amount;

        assert(contractBalance == previousBalance - amount);

        emit Withdrawn(amount);
    }
}
