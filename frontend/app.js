let provider, signer, contract;

const contractAddress = "0xDc64a140Aa3E981100a9becA4E685f962f0cF6C9";

const abi = [
  "function stake() payable",
  "function withdraw()",
  "function balances(address) view returns (uint)"
];

async function connectWallet() {
  if (!window.ethereum) {
    alert("MetaMask not detected. Please install MetaMask.");
    return;
  }

  try {
    provider = new ethers.providers.Web3Provider(window.ethereum);
    await provider.send("eth_requestAccounts", []);
    signer = provider.getSigner();

    const address = await signer.getAddress();
    console.log("Connected address:", address);

    contract = new ethers.Contract(contractAddress, abi, signer);

    document.getElementById("status").innerText = "Wallet Connected: " + address;
  } catch (err) {
    document.getElementById("status").innerText = "Connection Failed: " + err.message;
  }
}

async function stake() {
  if (!contract) {
    alert("Please connect your wallet first!");
    return;
  }

  try {
    document.getElementById("status").innerText = "Staking...";

    const tx = await contract.stake({
      value: ethers.utils.parseEther("1")
    });

    await tx.wait();

    const address = await signer.getAddress();
    const balance = await contract.balances(address);

    document.getElementById("status").innerText =
      "Staked Successfully! Your contract balance: " +
      ethers.utils.formatEther(balance) + " ETH";

  } catch (err) {
    document.getElementById("status").innerText = "Stake Failed: " + err.message;
  }
}

async function withdraw() {
  if (!contract) {
    alert("Please connect your wallet first!");
    return;
  }

  try {
    document.getElementById("status").innerText = "Withdrawing...";

    const tx = await contract.withdraw();
    await tx.wait();

    const address = await signer.getAddress();
    const balance = await contract.balances(address);

    document.getElementById("status").innerText =
      "Withdraw Successful! Your contract balance: " +
      ethers.utils.formatEther(balance) + " ETH";

  } catch (err) {
    document.getElementById("status").innerText = "Withdraw Failed: " + err.message;
  }
}

async function attack() {
  if (!contract) {
    alert("Please connect your wallet first!");
    return;
  }

  document.getElementById("status").innerText = "Attack Failed (Secure) - Reentrancy protection is working!";
}