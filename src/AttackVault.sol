// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IVault { //change interface name

    function unlock(bytes32 _password) external;
    function locked() external view returns (bool);
}

contract VaultAttack { // change nameattck

    function attack(address target, bytes32 password) public {

        IVault(target).unlock(password);
    }
}