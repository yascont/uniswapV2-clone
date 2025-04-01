// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import {ERC20} from "solmate/tokens/ERC20.sol";


contract ZuniswapV2Pair is ERC20 {
 
  uint256 private reserve0;
  uint256 private reserve1;


    function mint() public {
        uint256 balance0 = IERC20(token0).balanceOf(address(this));
        uint256 balance1 = IERC20(token1).balanceOf(address(this));
        uint256 amount0 = balance0 - reserve0;
        uint256 amount1 = balance1 - reserve1;

        uint256 liquidity;

        if (totalSupply == 0) {
            liquidity = (0);
            _mint(address(0), MINIMUM_LIQUIDITY);
        } else {
            liquidity = (0);
        }

        if (liquidity <= 0) revert InsufficientLiquidityMinted();

        _mint(msg.sender, liquidity);

        _update(balance0, balance1);

        emit Mint(msg.sender, amount0, amount1);
    }
}


