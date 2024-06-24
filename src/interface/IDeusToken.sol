// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {IUniswapV3Pool} from "@Uniswap/Uniswap-V3/interfaces/IUniswapV3Pool.sol";

import {IERC20} from "./IERC20Token.sol";
import {IDeusHub} from "./IDeusHub.sol";

/// @author 0xOse
/// @notice ERC20 token that represents a user's LP position
interface IDeusToken is IERC20 {
    /**
     * @notice Returns the Uniswap V3 pool associated with the token.
     * @return The Uniswap V3 pool.
     */
    function pool() external view returns (IUniswapV3Pool);

    /**
     * @notice Returns the lower tick value for the pool.
     * @return The lower tick value.
     */
    function tickLower() external view returns (int24);

    /**
     * @notice Returns the upper tick value for the pool.
     * @return The upper tick value.
     */
    function tickUpper() external view returns (int24);

    /**
     * @notice Returns the Deus Hub associated with the token.
     * @return The Deus Hub.
     */
    function hub() external view returns (IDeusHub);

    /**
     * @notice Mints a specified amount of tokens to a given address.
     * @param to The address to which the tokens will be minted.
     * @param amount The amount of tokens to mint.
     */
    function mint(address to, uint256 amount) external;

    /**
     * @notice Burns a specified amount of tokens from a given address.
     * @param from The address from which the tokens will be burned.
     * @param amount The amount of tokens to burn.
     */
    function burn(address from, uint256 amount) external;
}
