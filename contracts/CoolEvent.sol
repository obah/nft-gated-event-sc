// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./interface/ICoolNft.sol";

contract CoolEvent is Ownable {
    error MaximumGuestReached();
    error InvalidAddress();
    error UserHasNFT();

    event UserRegistered(address indexed account, uint256 indexed tokenId);

    ICoolNft coolNFT;

    uint40 public userId;
    uint40 immutable MAX_GUESTS;

    mapping(address => uint40) userToken;

    constructor(uint40 _max_guests, address _coolNFT) Ownable(msg.sender) {
        MAX_GUESTS = _max_guests;
        coolNFT = ICoolNft(_coolNFT);
    }

    function registerUser(
        address _account,
        string memory _tokenURI
    ) external onlyOwner {
        sanityCheck(_account);
        checkAttendanceSize();
        checkNft(_account);

        userId += 1;
        userToken[_account] = userId;

        coolNFT.mintNFT(_account, _tokenURI, userId);
    }

    function verifyUser(
        address _account
    ) external view onlyOwner returns (bool) {}

    function getUser(
        address _account
    ) external view onlyOwner returns (uint40) {
        return userToken[_account];
    }

    function checkAttendanceSize() private view {
        if (userId >= MAX_GUESTS) {
            revert MaximumGuestReached();
        }
    }

    function sanityCheck(address _account) private pure {
        if (_account == address(0)) {
            revert InvalidAddress();
        }
    }

    function checkNft(address _account) private {
        if (coolNFT.balanceOf(_account) != 0) {
            revert UserHasNFT();
        }
    }
}
