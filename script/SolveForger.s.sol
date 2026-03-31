// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/ForgerAttack.sol"; // 1) add file

contract SolveForge is Script { // 2) change contractName

    function run() external {

        address target = 0xc20eA669E9701Ba7AC35Cba5247f18bFFCeD5196; // 3) add ethernaut instance address
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(privateKey);

        ForgerAttack attacker = new ForgerAttack(target);

        attacker.attack();

        vm.stopBroadcast();

    }
}