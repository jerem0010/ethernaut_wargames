// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";

contract HashTest is Test {

    function testHash() public {
        bytes32 h = keccak256(abi.encode(" lunch and Dinner "));
        console.logBytes32(h);
    }

}