// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract VulnerableStaking {

    address public admin;
    uint256 public rewardRate;

    mapping(address => uint256) public balances;
    mapping(address => uint256) public stakingTime;

    constructor() {
        admin = msg.sender;
        rewardRate = 1e15; // reward per second
    }

    function stake() external payable {
        require(msg.value > 0, "Stake must be greater than 0");

        balances[msg.sender] += msg.value;
        stakingTime[msg.sender] = block.timestamp;
    }

    function withdraw(uint256 amount) external {
        require(balances[msg.sender] >= amount, "Insufficient balance");

        uint256 reward = calculateReward(msg.sender);

        // ⚠️ Reentrancy Vulnerability
        payable(msg.sender).transfer(amount + reward);

        balances[msg.sender] -= amount;
    }

    function claimReward() external {
        uint256 reward = calculateReward(msg.sender);
        payable(msg.sender).transfer(reward);
        stakingTime[msg.sender] = block.timestamp;
    }

    function calculateReward(address user) public view returns (uint256) {
        uint256 duration = block.timestamp - stakingTime[user];
        return (balances[user] * rewardRate * duration) / 1e18;
    }

    function setRewardRate(uint256 _rate) external {
        require(msg.sender == admin, "Not admin");
        rewardRate = _rate;
    }
}