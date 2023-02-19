// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TestNFT is ERC721, Ownable {
    uint private _token_counter; 
    mapping (uint=>address) private _idToAddress;
    mapping (address=>uint) private _addressToId;
    event NFTCreated(address indexed owner, uint tokenId, uint random);
    constructor() ERC721("TestNft", "NTK") {}

    function randomNumber() public returns(uint) {
        uint random=uint(keccak256(abi.encodePacked(block.timestamp, msg.sender)));
         _token_counter++;
        _idToAddress[random]=msg.sender;
        _addressToId[msg.sender]=random;
        uint tokenId = _token_counter;
         _mint(msg.sender, tokenId);
         emit NFTCreated(msg.sender, tokenId,random);
         return random;

    }

      function getTokenIdForUser(address user) public view returns (uint) {
        return _addressToId[user];
    }

    function getUserForTokenId(uint tokenId) public view returns (address) {
        return _idToAddress[tokenId];
    }
}
