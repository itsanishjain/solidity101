// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Allowlist is ERC721, Ownable {
    string public uriPrefix =
        "ipfs://bafkreidxw7o6evxxp6pfzdtreyuyai2at6ikmiaauwknmr2t5smfrifumy";

    uint256 public supply = 0;
    uint256 public cost = 10 ether;
    uint256 public constant maxSupply = 10000;

    constructor() ERC721("Allowlist", "AWL") {}

    function mint() public payable {
        require(supply < maxSupply, "MAX_SUPPLY_EXCEEDED");
        if (msg.sender != owner()) {
            require(msg.value >= cost, "INSUFFICIENT_FUND");
        }
        ++supply;
        _mint(msg.sender, supply);
    }

    function tokenURI(uint256 _tokenId)
        public
        view
        virtual
        override
        returns (string memory)
    {
        require(_exists(_tokenId), "INVALID_ID");
        return bytes(uriPrefix).length > 0 ? uriPrefix : "";
    }

    function setUriPrefix(string memory _uriPrefix) public onlyOwner {
        uriPrefix = _uriPrefix;
    }

    function updateMintingCost(uint _cost) public onlyOwner {
        cost = _cost;
    }

    function withdraw() public onlyOwner {
        (bool hs, ) = payable(owner()).call{value: address(this).balance}("");
        require(hs);
    }
}
