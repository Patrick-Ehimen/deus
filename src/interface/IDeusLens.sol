// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {DeusKey} from "../base/Structs.sol";
import {IDeusHub} from "./IDeusHub.sol";

/// @title DeusLens
/// @notice Helper functions for fetching info about Deus positions
interface IDeusLens {
    /// @notice The DeusHub that the lens contract reads from
    function hub() external view returns (IDeusHub);

    /// @notice Computes the amount of liquidity and token amounts each full share token
    /// can be redeemed for when calling withdraw().
    /// @param key The Deus position's key
    /// @return liquidity_ The liquidity amount that each full share is worth
    /// @return amount0 The amount of token0 that each full share can be redeemed for
    /// @return amount1 The amount of token1 that each full share can be redeemed for
    function pricePerFullShare(
        DeusKey calldata key
    )
        external
        view
        returns (uint128 liquidity_, uint256 amount0, uint256 amount1);

    /// @notice Returns the token reserve in the liquidity position.
    /// @param key The Deus position's key
    /// @return reserve0 The amount of token0 in the liquidity position
    /// @return reserve1 The amount of token1 in the liquidity position
    function getReserves(
        DeusKey calldata key
    ) external view returns (uint112 reserve0, uint112 reserve1);
}
