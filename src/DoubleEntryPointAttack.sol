// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IForta {
    function raiseAlert(address user) external;
    function setDetectionBot(address detectionBotAddress) external;
}

interface IDetectionBot {
    function handleTransaction(address user, bytes calldata msgData) external;
}

contract MyBot is IDetectionBot {

    address public vault;

    constructor(address _vault) {
        vault = _vault;
    }

    function handleTransaction(address user, bytes calldata msgData) external override {

        (, , address origSender) = abi.decode(
            msgData[4:], 
            (address, uint256, address)
        );

        if (origSender == vault) {
            IForta(msg.sender).raiseAlert(user);
        }
    }
}