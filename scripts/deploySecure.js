async function main() {
  const SecureStaking = await ethers.getContractFactory("SecureStaking");
  const secure = await SecureStaking.deploy();

  await secure.deployed();

  console.log("SecureStaking deployed to:", secure.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});