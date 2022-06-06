// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract GoodContract {
    mapping(address => uint) balances;
    bool locked;

    modifier nonReentrant() {
        require(!locked, "No re-entrancy");
        locked = true;
        _;
        locked = false;
    }

    function addBalance() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public nonReentrant {
        require(balances[msg.sender] > 0);
        (bool sent, ) = msg.sender.call{value: balances[msg.sender]}("");
        require(sent, "FAILED TO SEND ETHER");
        balances[msg.sender] = 0;
    }
}
