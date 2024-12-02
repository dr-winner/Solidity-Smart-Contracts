// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FeeCollector {
    address public owner;
    uint256 public balance;

    constructor() {
        owner = msg.sender; // 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
    }

    receive() external payable { 
        balance += msg.value;
    }

    function  withdraw(uint256 amount, address payable  destAddrss) public {
        require(msg.sender == owner, "Only the owner can withdraw");
        require(amount <= balance, "Insufficient balance");
        
        destAddrss.transfer(amount);
        balance -= amount;
    }
}