// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "forge-std/console.sol";

contract TestHash is Script {

    function run() external {
        bytes32 h = keccak256(abi.encode("lunch and Dinner "));
        console.logBytes32(h);
    }

}