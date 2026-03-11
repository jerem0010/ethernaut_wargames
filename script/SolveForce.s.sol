// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/ForceAttack.sol"; //add file

contract SolveForce is Script { // change contractName

    function run() external {

        address target = 0xA62e1b3d425Fa8eb958bAbb0871304C469DdA8A1; //add ethernaut instance address
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(privateKey);

        ForceAttack attacker = new ForceAttack{value: 1 wei}();

        attacker.attack(payable(target));

        vm.stopBroadcast();

    }
}