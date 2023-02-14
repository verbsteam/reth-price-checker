// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

import "forge-std/Script.sol";
import {WstethRethExpectedOutPriceChecker} from "../src/WstethRethExpectedOutPriceChecker.sol";
import {DynamicSlippageChecker} from "../src/DynamicSlippageChecker.sol";

contract DeployPriceCheckerScript is Script {
    function run() public {
        vm.startBroadcast();

        new DynamicSlippageChecker("RETH_DYNAMIC_SLIPPAGE_PRICE_CHECKER", address(new WstethRethExpectedOutPriceChecker()));

        vm.stopBroadcast();
    }
}
