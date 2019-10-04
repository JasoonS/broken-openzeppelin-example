pragma solidity ^0.5.0;

import "@openzeppelin/contracts-ethereum-package/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts-ethereum-package/contracts/token/ERC721/ERC721Enumerable.sol";
import "@openzeppelin/contracts-ethereum-package/contracts/token/ERC721/ERC721Metadata.sol";
import "@openzeppelin/contracts-ethereum-package/contracts/token/ERC721/ERC721MetadataMintable.sol";
// import "../node_modules/@openzeppelin/contracts-ethereum-package/contracts/token/ERC721/ERC721.sol";
// import "../node_modules/@openzeppelin/contracts-ethereum-package/contracts/token/ERC721/ERC721Enumerable.sol";
// import "../node_modules/@openzeppelin/contracts-ethereum-package/contracts/token/ERC721/ERC721Metadata.sol";

contract ERC721Extended is Initializable, ERC721, ERC721Enumerable, ERC721Metadata, ERC721MetadataMintable {

    function setup(string memory name, string memory symbol, address minter) public initializer {
        ERC721.initialize();
        ERC721Enumerable.initialize();
        ERC721Metadata.initialize(name, symbol);
        // Initialize the minter and pauser roles, and renounce them
        ERC721MetadataMintable.initialize(address(this));
        _removeMinter(address(this));
        _addMinter(minter);
    }
}
