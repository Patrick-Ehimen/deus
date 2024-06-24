// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {IUniswapV3Factory} from "@Uniswap/Uniswap-V3/interfaces/IUniswapV3Factory.sol";
import {IUniswapV3MintCallback} from "@Uniswap/Uniswap-V3/interfaces/callback/IUniswapV3MintCallback.sol";

interface ILiquidityManagement is IUniswapV3MintCallback {
    /// @notice Returns the Uniswap V3 factory
    /// @return The address of the Uniswap V3 factory
    function factory() external view returns (IUniswapV3Factory);
}
