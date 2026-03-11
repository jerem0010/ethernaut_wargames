// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/Attack"; // 1) add file

contract SolveName is Script { // 2) change contractName

    function run() external {

        address target = ; // 3) add ethernaut instance address
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(privateKey);

        vm.stopBroadcast();

    }
}