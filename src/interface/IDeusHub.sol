// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {IUniswapV3Pool} from "@Uniswap/Uniswap-V3/interfaces/IUniswapV3Pool.sol";

import {IMulticall} from "@Uniswap/Uniswap-V3-Periphery/contracts/interfaces/IMulticall.sol";

import {ISelfPermit} from "@Uniswap/Uniswap-V3-Periphery/contracts/interfaces/ISelfPermit.sol";

import {DeusKey} from "../base/Structs.sol";

import {IERC20} from "./IERC20Token.sol";

import {IDeusToken} from "./IDeusToken.sol";

import {ILiquidityManagement} from "./ILiquidityManagement.sol";

interface IDeusHub is IMulticall, ISelfPermit, ILiquidityManagement {
    event Deposit(
        address indexed sender,
        address indexed recipient,
        bytes32 indexed deusKeyHash,
        uint128 liquidity,
        uint256 amount0,
        uint256 amount1,
        uint256 shares
    );

    event Withdraw(
        address indexed sender,
        address indexed recipient,
        bytes32 indexed deusKeyHash,
        uint128 liquidity,
        uint256 amount0,
        uint256 amount1,
        uint256 shares
    );

    event Compound(
        address indexed sender,
        bytes32 indexed deusKeyHash,
        uint128 liquidity,
        uint256 amount0,
        uint256 amount1
    );

    event NewDeus(
        IDeusToken indexed token,
        bytes32 indexed deusKeyHash,
        IUniswapV3Pool indexed pool,
        int24 tickLower,
        int24 tickUpper
    );

    event PayProtocolFee(uint256 amount0, uint256 amount1);
    event SetProtocolFee(uint256 newProtocolFee);

    struct DepositParams {
        DeusKey key;
        uint256 amount0Desired;
        uint256 amount1Desired;
        uint256 amount0Min;
        uint256 amount1Min;
        uint256 deadline;
        address recipient;
    }

    /**
     * @notice Deposits tokens into the pool
     * @param params The parameters for the deposit
     * @return removedLiquidity The amount of liquidity removed
     * @return amount0 The amount of token0
     * @return amount1 The amount of token1
     */
    function deposit(
        DepositParams calldata params
    )
        external
        returns (uint128 removedLiquidity, uint256 amount0, uint256 amount1);

    /**
     * @notice Compounds the rewards for a given DeusKey
     * @param key The DeusKey for the compound
     * @return addedLiquidity The amount of liquidity added
     * @return amount0 The amount of token0
     * @return amount1 The amount of token1
     */
    function compound(
        DeusKey calldata key
    )
        external
        returns (uint128 addedLiquidity, uint256 amount0, uint256 amount1);

    /**
     * @notice Deploys a new DeusToken
     * @param key The DeusKey for the new token
     * @return token The deployed DeusToken
     */
    function deployDeusToken(
        DeusKey calldata key
    ) external returns (IDeusToken token);

    /**
     * @notice Gets an existing DeusToken
     * @param key The DeusKey of the token to get
     * @return token The corresponding DeusToken
     */
    function getDeusToken(
        DeusKey calldata key
    ) external view returns (IDeusToken token);

    /**
     * @notice Sweeps the specified tokens to a recipient
     * @param tokenList The list of tokens to sweep
     * @param recipient The recipient of the swept tokens
     */
    function sweepTokens(
        IERC20[] calldata tokenList,
        address recipient
    ) external;

    /**
     * @notice Sets the protocol fee
     * @param value The new protocol fee value
     */
    function setProtocolFee(uint256 value) external;

    /**
     * @notice Gets the current protocol fee
     * @return The current protocol fee
     */
    function protocolFee() external returns (uint256);
}
