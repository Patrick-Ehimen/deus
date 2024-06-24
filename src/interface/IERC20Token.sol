// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 * Modified from OpenZeppelin's IERC20 contract
 */
interface IERC20 {
    /// @notice Returns the total token supply
    /// @return The total supply of the token
    function totalSupply() external view returns (uint256);

    /// @notice Returns the balance of a given account
    /// @param account The address of the account to query
    /// @return The balance of the specified account
    function balanceOf(address account) external view returns (uint256);

    /// @notice Transfers tokens to a specified address
    /// @param recipient The address to transfer to
    /// @param amount The amount to be transferred
    /// @return True if the operation was successful
    function transfer(
        address recipient,
        uint256 amount
    ) external returns (bool);

    /// @notice Returns the allowance a spender has from an owner
    /// @param owner The address of the token owner
    /// @param spender The address of the spender
    /// @return The remaining amount the spender is allowed to spend
    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    /// @notice Approves the passed address to spend the specified amount of tokens on behalf of the msg.sender
    /// @param spender The address which will spend the funds
    /// @param amount The amount of tokens to be spent
    /// @return True if the operation was successful
    function approve(address spender, uint256 amount) external returns (bool);

    /// @notice Transfers tokens from one address to another using the allowance mechanism
    /// @param sender The address which you want to send tokens from
    /// @param recipient The address which you want to transfer to
    /// @param amount The amount of tokens to be transferred
    /// @return True if the operation was successful
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    /// @notice Returns the name of the token
    /// @return The name of the token
    function name() external view returns (string memory);

    /// @notice Returns the symbol of the token
    /// @return The symbol of the token
    function symbol() external view returns (string memory);

    /// @notice Returns the number of decimals used to get its user representation
    /// @return The number of decimals
    function decimals() external view returns (uint8);

    /// @notice Returns the nonce of a given account
    /// @param account The address to query
    /// @return The nonce of the specified account
    function nonces(address account) external view returns (uint256);

    /// @notice Allows an owner to approve a spender to spend a specific value using EIP-2612 signature method
    /// @param owner The address of the owner
    /// @param spender The address of the spender
    /// @param value The amount of tokens to be spent
    /// @param deadline The time by which the permit must be used
    /// @param v The recovery byte of the signature
    /// @param r Half of the ECDSA signature pair
    /// @param s Half of the ECDSA signature pair
    function permit(
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;

    /// @notice Returns the domain separator used in the encoding of the signature for `permit`
    /// @return The domain separator
    function DOMAIN_SEPARATOR() external view returns (bytes32);

    /// @notice Emitted when `value` tokens are moved from one account (`from`) to another (`to`)
    /// @param from The address from which the tokens were sent
    /// @param to The address to which the tokens were sent
    /// @param value The amount of tokens transferred
    event Transfer(address indexed from, address indexed to, uint256 value);

    /// @notice Emitted when the allowance of a `spender` for an `owner` is set by a call to {approve}
    /// @param owner The address of the token owner
    /// @param spender The address of the spender
    /// @param value The new allowance
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
}
