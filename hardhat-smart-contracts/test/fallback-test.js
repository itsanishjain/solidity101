const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Fallback", function () {
  it("Should return the new greeting once it's changed", async function () {
    const Fallback = await ethers.getContractFactory("Fallback");
    const fallback = await Fallback.deploy();
    await fallback.deployed();
     
    console.log(await fallback.owner(),"SDSD")
    // console.log(await fallback.getContribution(),"FDFDASFADSFSDFSDF");

    // expect(await fallback.ownwer).to.equal(
    //   "0xc77327F1851255b9f4DA527CEDB91C54499123ef"
    // );

  });
});
