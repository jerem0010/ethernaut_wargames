// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/DoubleEntryPointAttack.sol";

interface IDoubleEntryPoint {
    function cryptoVault() external view returns (address);
    function forta() external view returns (address);
}

contract Deploy is Script {

    function run() external {

        address det = vm.envAddress("0x34bD06F195756635a10A7018568E033bC15F3FB5");

        vm.startBroadcast();

        // récupérer les contrats
        IDoubleEntryPoint instance = IDoubleEntryPoint(det);

        address vault = instance.cryptoVault();
        address fortaAddr = instance.forta();

        // déployer le bot
        MyBot bot = new MyBot(vault);

        // enregistrer le bot
        IForta(fortaAddr).setDetectionBot(address(bot));

        vm.stopBroadcast();
    }
}