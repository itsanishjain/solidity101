// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4;

// 1 ETH = 10**9 GWEI = 10 **18 WEI

contract Fallout {
    mapping(address => uint256) allocations;
    address payable public owner;

    // constructor
    constructor() payable {
        owner = payable(msg.sender);
        allocations[owner] = msg.value;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "caller is not the owner");
        _;
    }

    function allocate() public payable {
        allocations[msg.sender] += msg.value;
    }

    function sendAllocation(address payable allocator) public {
        require(allocations[allocator] > 0, "NO FUNDS on this address");
        allocator.transfer(allocations[allocator]);
    }

   function collectAllocations() public onlyOwner {
    payable (msg.sender).transfer(address(this).balance);
  }

    function allocatorBalance(address allocator) public view returns (uint256) {
        return allocations[allocator];
    }
}
