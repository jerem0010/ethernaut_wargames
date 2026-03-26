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

        address det = 0x8bB1EE0A5067D779659663CBccc6Cc88c7b4562c;
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(privateKey);

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