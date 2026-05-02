// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SecureStaking {

    mapping(address => uint256) public balances;

    bool private locked;

    modifier noReentrant() {
        require(!locked, "Reentrant call detected!");
        locked = true;
        _;
        locked = false;
    }

    function stake() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public noReentrant {
        uint256 amount = balances[msg.sender];
        require(amount > 0, "No funds");

        balances[msg.sender] = 0;

        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Transfer failed");
    }
}