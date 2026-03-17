// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/GatekeeperTwoAttack.sol"; // 1) add file

contract SolveGatekeeperTwo is Script { // 2) change contractName

    function run() external {

        address target = 0x1936b38B8c88e10Cf4468424a619B82f605BEba4; // 3) add ethernaut instance address
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(privateKey);

        GatekeeperTwoAttack attacker = new GatekeeperTwoAttack(target);

        vm.stopBroadcast();

    }
}