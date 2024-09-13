// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract CoolEventFactory {
    event ContractDeployed(address indexed contractAddress);

    address[] public contractAddresses;

    function createCoolEvent(
        bytes memory _bytecode,
        uint256 _salt
    ) external returns (uint256 length_) {
        address contractAddress;

        assembly {
            contractAddress := create2(
                0,
                add(_bytecode, 0x20),
                mload(_bytecode),
                _salt
            )
            if iszero(extcodesize(contractAddress)) {
                revert(0, 0)
            }
        }
`
        contractAddresses.push(contractAddress);
        length_ = contractAddresses.length;

        emit ContractDeployed(contractAddress);
    }

    function getContracts() external view returns (address[] memory) {
        return contractAddresses;
    }

    // function createCoolEvent(
    //     uint40 _max_guests,
    //     address _nft
    // ) external returns (CoolEvent coolEvent_, uint256 length_) {
    //     coolEvent_ = new CoolEvent(_max_guests, _nft);

    //     coolEvents.push(coolEvent_);

    //     length_ = coolEvents.length;
    // }

    // function getCoolEvents() external view returns (CoolEvent[] memory) {
    //     return coolEvents;
    // }
}
