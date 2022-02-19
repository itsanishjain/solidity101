const { ethers } = require("hardhat");

async function main() {

  // Fallback.sol
  // const fallbackContract = await ethers.getContractFactory("Fallback");

  // const deployFallbackContract = await fallbackContract.deploy();


  // await deployFallbackContract.deployed();
  
  // console.log(deployFallbackContract.address);

  // Fallout.sol

  
}

main()
  .then(() => {
    process.exit(0);
  })
  .catch((error) => {
    console.log("ERROR :)", error);
    process.exit(1);
  });
