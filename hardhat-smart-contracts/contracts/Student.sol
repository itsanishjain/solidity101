pragma solidity ^0.8.4;

contract Student {
    uint public mySum; // 1 slot
    address public studentAddress; // 160bits 1/2 slot

    function addTwoNumbers(
        address calculator,
        uint a,
        uint b
    ) public returns (uint) {
        (bool success, bytes memory result) = calculator.delegatecall(
            abi.encodeWithSignature("add(uint256,uint256)", a, b)
        );

        require(success, "The call to calculator contract failed");

        return abi.decode(result, (uint));
    }
}

contract Calculator {
    uint public result;
    address public user;

    function add(uint a, uint b) public returns (uint) {
        result = a + b;
        user = msg.sender;
        return result;
    }
}

contract Good {
    address public helper;
    address public owner;
    uint public num;

    constructor(address _helper) {
        helper = _helper;
        owner = msg.sender;
    }
}
