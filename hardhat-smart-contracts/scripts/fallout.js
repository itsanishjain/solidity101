const { ethers } = require("hardhat");

async function main() {
  const Fallout = await ethers.getContractFactory("Fallout");
  const fallout = await Fallout.deploy(10 * 10 ** 18);
  await fallout.deployed();
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
