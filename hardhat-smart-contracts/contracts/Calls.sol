// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract C {
    uint public value;
    address public caller;

    function setValueAndCallerInC() public payable {
        value = msg.value;
        caller = msg.sender;
    }
}

contract B {
    uint public value;
    uint balanceB;
    address public caller;

    C public c;

    function setValueAndCallerInB() public payable {
        value = msg.value;
        caller = msg.sender;
        balanceB += msg.value;
    }

    function callToC(address _c) public {
        c = C(_c);
        c.setValueAndCallerInC{value: balanceB - 10}();
    }
}

contract A {
    B public b;
    uint public balance;

    function fundMe() public payable {
        console.log("VALUE", msg.value);
        balance += msg.value;
    }

    function callToB(address _b) public {
        b = B(_b);
        b.setValueAndCallerInB{value: balance - 10}();
    }
}
