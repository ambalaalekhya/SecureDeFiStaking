 
# Secure DeFi Staking Platform

A secure Ethereum staking DApp built with Solidity, Hardhat, and Ethers.js. Users can stake ETH, withdraw it, and the contract is protected against reentrancy attacks.

---

## Live Demo
[View on Render](https://securedefistaking.onrender.com/)

> Note: Requires local Hardhat node running to interact with the contract.

---

## Tech Stack
- Solidity (Smart Contract)
- Hardhat (Local Blockchain)
- Ethers.js (Blockchain Interaction)
- MetaMask (Wallet)
- HTML/CSS/JavaScript (Frontend)

---

## Prerequisites

Make sure you have these installed before running the project:

| Tool | Version | Download |
|------|---------|----------|
| Node.js | v18 or v20 (NOT v24) | [nodejs.org](https://nodejs.org) |
| npm | v9+ | Comes with Node.js |
| MetaMask | Latest | [metamask.io](https://metamask.io) |
| Git | Latest | [git-scm.com](https://git-scm.com) |

---

## Installation & Setup

### 1. Clone the repository
```bash
git clone https://github.com/ambalaalekhya/SecureDeFiStaking.git
cd SecureDeFiStaking
```

### 2. Install dependencies
```bash
npm install
```

### 3. Start the local Hardhat blockchain
Open a terminal and run:
```bash
cd contracts
npx hardhat node
```
Keep this terminal open. It will show test accounts with 10000 ETH each.

### 4. Deploy the smart contract
Open a second terminal and run:
```bash
npx hardhat run scripts/deploySecure.js --network localhost
```
Copy the deployed contract address shown in the output.

### 5. Update contract address (if redeployed)
Open `frontend/app.js` and update this line with your new address:
```javascript
const contractAddress = "YOUR_DEPLOYED_CONTRACT_ADDRESS";
```

### 6. Open the frontend
Open `frontend/index.html` in your browser directly, or serve it with:
```bash
npx serve frontend
```
Then go to `http://localhost:3000`

---

## MetaMask Setup

### Add Localhost Network to MetaMask
1. Open MetaMask
2. Click Networks → Add Network
3. Fill in:
   - **Network Name:** Localhost
   - **RPC URL:** http://127.0.0.1:8545
   - **Chain ID:** 31337
   - **Currency Symbol:** ETH

### Import a Test Account
1. Copy a private key from the Hardhat node terminal output
2. In MetaMask → Import Account → Paste private key
3. Switch to this account (it has 10000 test ETH)

---

## How to Use the App

1. Click **"Connect Wallet"** — MetaMask will ask for permission
2. Click **"Stake 1 ETH"** — Confirm the transaction in MetaMask
3. Click **"Withdraw"** — Retrieves your staked ETH
4. Click **"Try Attack"** — Demonstrates reentrancy protection (attack fails)

---

## Smart Contract Features

- `stake()` — Stake ETH into the contract
- `withdraw()` — Withdraw your staked ETH
- `balances(address)` — Check staked balance of any address
- **Reentrancy Guard** — Protects against reentrancy attacks

---

## Project Structure



---

## Security
This contract is protected against **reentrancy attacks** using a mutex lock pattern. The `Try Attack` button in the UI demonstrates that attack attempts are blocked.

---
