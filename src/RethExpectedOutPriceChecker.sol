// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

import {IExpectedOutCalculator} from "./interfaces/IExpectedOutCalculator.sol";
import {IRocketPoolEth} from "./interfaces/IRocketPoolEth.sol";

contract RethExpectedOutPriceChecker is IExpectedOutCalculator {
    address public constant ROCKET_POOL_ETH = 0xae78736Cd615f374D3085123A210448E74Fc6393;
    address public constant LIDO_ST_ETH = 0xae7ab96520DE3A18E5e111B5EaAb095312D7fE84;

    error INVALID_TOKEN_PAIR();

    function getExpectedOut(uint256 _amountIn, address _fromToken, address _toToken, bytes calldata)
        external
        view
        override
        returns (uint256)
    {
        if (_fromToken == LIDO_ST_ETH && _toToken == ROCKET_POOL_ETH) {
            return IRocketPoolEth(ROCKET_POOL_ETH).getRethValue(_amountIn);
        }
        if (_fromToken == ROCKET_POOL_ETH && _toToken == LIDO_ST_ETH) {
            return IRocketPoolEth(ROCKET_POOL_ETH).getEthValue(_amountIn);
        }
        revert INVALID_TOKEN_PAIR();
    }
}
