// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./CoolEvent.sol";

contract CoolEventFactory {
    CoolEvent[] coolEvents;

    function createCoolEvent(
        uint40 _max_guests,
        address _nft
    ) external returns (CoolEvent coolEvent_, uint256 length_) {
        coolEvent_ = new CoolEvent(_max_guests, _nft);

        coolEvents.push(coolEvent_);

        length_ = coolEvents.length;
    }

    function getCoolEvents() external view returns (CoolEvent[] memory) {
        return coolEvents;
    }
}
