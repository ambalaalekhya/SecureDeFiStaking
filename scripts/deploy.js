const { ethers } = require("hardhat");

async function main() {
  const Staking = await ethers.getContractFactory("VulnerableStaking");
  const staking = await Staking.deploy();

  await staking.deployed();

  console.log("VulnerableStaking deployed to:", staking.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});