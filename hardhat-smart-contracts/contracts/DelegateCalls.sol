// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TestDelegateCall {
    uint public value;

    function setValue(uint _value) public {
        value = _value;
    }
}

contract DelegateCall {
    uint public value;

    function setValue(address _testContract, uint _value) public {
        (bool success, bytes memory data) = _testContract.delegatecall(
            abi.encodeWithSelector(TestDelegateCall.setValue.selector, _value)
        );

        require(success, "Delegate Call Failed");
    }
}
