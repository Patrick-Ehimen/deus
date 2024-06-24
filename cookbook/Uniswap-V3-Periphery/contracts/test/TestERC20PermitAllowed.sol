/*
  
 ██████  ██████   ██████  ██   ██ ██████   ██████   ██████  ██   ██    ██████  ███████ ██    ██
██      ██    ██ ██    ██ ██  ██  ██   ██ ██    ██ ██    ██ ██  ██     ██   ██ ██      ██    ██
██      ██    ██ ██    ██ █████   ██████  ██    ██ ██    ██ █████      ██   ██ █████   ██    ██
██      ██    ██ ██    ██ ██  ██  ██   ██ ██    ██ ██    ██ ██  ██     ██   ██ ██       ██  ██
 ██████  ██████   ██████  ██   ██ ██████   ██████   ██████  ██   ██ ██ ██████  ███████   ████

Find any smart contract, and build your project faster: https://www.cookbook.dev
Twitter: https://twitter.com/cookbook_dev
Discord: https://discord.gg/WzsfPcfHrk

Find this contract on Cookbook: https://www.cookbook.dev/contracts/Uniswap-V3-Periphery/?utm=code
*/

// SPDX-License-Identifier: UNLICENSED
pragma solidity =0.7.6;

import './TestERC20.sol';
import '../interfaces/external/IERC20PermitAllowed.sol';

// has a fake permit that just uses the other signature type for type(uint256).max
contract TestERC20PermitAllowed is TestERC20, IERC20PermitAllowed {
    constructor(uint256 amountToMint) TestERC20(amountToMint) {}

    function permit(
        address holder,
        address spender,
        uint256 nonce,
        uint256 expiry,
        bool allowed,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external override {
        require(this.nonces(holder) == nonce, 'TestERC20PermitAllowed::permit: wrong nonce');
        permit(holder, spender, allowed ? type(uint256).max : 0, expiry, v, r, s);
    }
}
