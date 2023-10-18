// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Campaign is ERC721, ERC721Enumerable, ERC721URIStorage {
    //State Variables
    string public title;
    string public description;
    string public imageUrl;
    string public metadataUri;
    uint256 public maximumTokenSupply;
    uint256 public mintedTokens;
    address public campaignCreator;

    //Constructor
    constructor(
        string memory _title,
        string memory _description,
        string memory _imageUrl,
        string memory _metadataUri,
        uint256 _totalSupply,
        address creator
    ) ERC721(_title, _description) {
        title = _title;
        description = _description;
        imageUrl = _imageUrl;
        maximumTokenSupply = _totalSupply;
        mintedTokens = 0;
        metadataUri = _metadataUri;
        campaignCreator = creator;
    }

    function safeMint() public {
        require(
            mintedTokens < maximumTokenSupply,
            "All tokens have been minted"
        );
        uint256 tokenId = mintedTokens + 1;
        _mint(msg.sender, tokenId);
        _setTokenURI(tokenId, metadataUri);

        mintedTokens++;
    }

    // The following functions are overrides required by Solidity.

    function _update(
        address to,
        uint256 tokenId,
        address auth
    ) internal override(ERC721, ERC721Enumerable) returns (address) {
        return super._update(to, tokenId, auth);
    }

    function _increaseBalance(address account, uint128 value)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._increaseBalance(account, value);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721URIStorage, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}