# Secure DeFi Staking Platform

## 📌 Project Overview

This project implements a simplified decentralized finance (DeFi) staking smart contract using Solidity and Hardhat.

The system allows users to:

- Stake (deposit) ETH
- Earn rewards based on staking duration
- Withdraw their staked ETH along with earned rewards

This smart contract runs on an Ethereum blockchain (local Hardhat network) and demonstrates how decentralized financial systems operate without banks or intermediaries.

---

## 🧠 Purpose of the Project (In Simple Words)

In traditional banking:

- You deposit money in a savings account
- The bank calculates interest
- You withdraw your money later with interest

In this project:

- You deposit ETH into a smart contract
- The smart contract calculates rewards automatically
- You withdraw your ETH + rewards
- No bank or central authority is involved

This project demonstrates how blockchain-based financial systems (DeFi) replace centralized control with code.

---

## 🛠 Technologies Used

- **Solidity (v0.8.x)** – Smart contract programming language
- **Hardhat** – Ethereum development framework
- **Ethers.js** – Interaction with smart contract
- **Node.js** – JavaScript runtime
- **Local Hardhat Network** – Testing blockchain

---

## 🏗 What Has Been Built

- A staking smart contract (`VulnerableStaking.sol`)
- ETH deposit functionality
- Time-based reward calculation
- Withdrawal mechanism
- Local blockchain deployment
- Console-based interaction

⚠ Note: The contract intentionally contains security weaknesses (e.g., reentrancy vulnerability) for academic analysis in later milestones.

---

# 🚀 How to Run the Project

Follow these steps to run the project locally.

---
```bash 
## 1 Clone the Repository
git clone https://github.com/ambalaalekhya/SecureDeFiStaking.git
cd SecureDeFiStaking
## 2 Install Node.js

Make sure Node.js is installed:
https://nodejs.org/
---
## 3 Install Project Dependencies
From the project root directory:
```bash
npm install
#Compile the Smart Contract
npx hardhat compile
#Start Local Ethereum Blockchain
#Open Terminal 1 and run: npx hardhat node (This starts a local Ethereum blockchain at: http://127.0.0.1:8545) [Keep this thing running]
#Deploy the Smart Contract
Open Terminal 2 (new window) in the project root:npx hardhat run scripts/deploy.js --network localhost (copy the deployed address You will need it to interact with system)

#Interact With the Contract
Open Terminal 3: npx hardhat console --network localhost (run the below code on this terminal)
const staking = await ethers.getContractAt(
  "VulnerableStaking",
  "PASTE_DEPLOYED_ADDRESS_HERE" //paste the copied address here
)
const [owner] = await ethers.getSigners()

#On the same terminal run the below code one by one to interact with the Smart Contract System
// Stake 1 ETH (depositing 1 Etherium to the smart contract)
await staking.stake({ value: ethers.utils.parseEther("1") })   

// Check stored balance
await staking.balances(owner.address)

// Simulate 1 hour passing (or leave it for like 1 hour to see the reward that gets generated)
await network.provider.send("evm_increaseTime", [3600])
await network.provider.send("evm_mine")

// Calculate reward
await staking.calculateReward(owner.address)

To Stop the Blockchain
Press: Ctrl + C (in the terminal running npx hardhat node.)
