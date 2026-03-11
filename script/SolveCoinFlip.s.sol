// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/CoinFlipAttack.sol";

contract SolveCoinFlip is Script {

    function run() external {

        address target = 0x51F3364f364a02cFd73752bb4a1eA68541a9Ef63;
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(privateKey);

        CoinFlipAttack attacker = new CoinFlipAttack();

        attacker.attack(target);

        console.log("Le nombre de win est: ", ICoinFlip(target).consecutiveWins());

        vm.stopBroadcast();
    }
}