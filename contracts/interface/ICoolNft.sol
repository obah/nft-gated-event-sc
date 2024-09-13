// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

interface ICoolNft is IERC721 {
    function mintNFT(
        address _recipient,
        string memory _tokenURI,
        uint40 _tokenId
    ) external;
}
