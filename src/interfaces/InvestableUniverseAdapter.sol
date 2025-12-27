// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

//@report[I-1] this interface is empty and no one use the interface
//? where the interface is used
interface IInvestableUniverseAdapter {
    // function invest(IERC20 token, uint256 amount) external;
    // function divest(IERC20 token, uint256 amount) external;
}
