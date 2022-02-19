// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4;

contract Fallback {
    mapping(address => uint256) public contributions;
    address payable public owner;

    constructor() {
        owner = payable(msg.sender); // typecast normal address to payable means this can send funds from sc
        contributions[msg.sender] = 1000 * (1 ether);
    }

    /*
        https://medium.com/coinmonks/solidity-tutorial-all-about-modifiers-a86cf81c14cb

        TLDR;
        What is modifier?
        it aims to change the behaviour of the function to which it is attached.

        for eg: automatically checking a condition prior to executing the function [mainly what they are used for].

        it reduce code redundancy.

        '_' is called merge wildcard. It mergers the function code with the modifier code
        where the _ is placed

     */

    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _; // modifier body should containe _
    }

    // payable function excepts funds
    function contribute() public payable {
        require(msg.value < 0.001 ether);
        contributions[msg.sender] += msg.value;
        if (contributions[msg.sender] > contributions[owner]) {
            owner = payable(msg.sender);
        }
    }

    function getContribution() public view returns (uint256) {
        return contributions[msg.sender];
    }

    // we use our own modifier to check for transfer before running this code.

    function withdraw() public onlyOwner {
        /* this represents the "THIS" contract
            and we type cast it to address
            */
        owner.transfer(address(this).balance);
    }

    // this function cannot be accessed internally, only externally
    receive() external payable {
        require(msg.value > 0 && contributions[msg.sender] > 0);
        owner = payable(msg.sender);
    }
}

