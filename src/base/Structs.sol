// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;
pragma abicoder v2;

import {IUniswapV3Pool} from "@Uniswap/Uniswap-V3/interfaces/IUniswapV3Pool.sol";

contract DeusKey {
    /// @notice The Uniswap V3 Pool instance
    IUniswapV3Pool pool;

    /// @notice Lower tick boundary for the pool
    int24 tickLower;

    /// @notice Upper tick boundary for the pool
    int24 tickHiger;
}
