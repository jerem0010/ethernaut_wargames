// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/ElevatorAttack.sol"; // 1) add file

contract SolveName is Script { // 2) change contractName

    function run() external {

        address target = 0xA868e37067364887A2F8A28cBA085F0a6428cD7C; // 3) add ethernaut instance address
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(privateKey);

        ElevatorAttack attacker = new ElevatorAttack();

        attacker.attack(target);

        console.log("Le top est: ", IElevator(target).top());

        vm.stopBroadcast();

    }
}