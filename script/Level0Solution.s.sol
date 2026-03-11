// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Level0.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";
import "../src/AttackHelloEthernaut.sol";

contract Level0Solution is Script {
    
    address instance = vm.envAddress("INSTANCE_ADDRESS");
    Instance level0 = Instance(instance);

    function run() external {
        string memory password = level0.password();
        console.log("Pasword: ", password);
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        level0.authenticate(password);
        vm.stopBroadcast();
    }
}

contract AttackHelloEthernautScript is Script {
    function run() external {
        address instance = vm.envAddress("INSTANCE_ADDRESS");
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(privateKey);

        AttackHelloEthernaut attacker = new AttackHelloEthernaut(instance);
        attacker.run();

        vm.stopBroadcast();

        bool cleared = attacker.isCleared();
        console.log("Cleared:", cleared);
        console.log("Attacker contract:", address(attacker));
    }
}