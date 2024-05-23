// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {SymTest} from "halmos-cheatcodes/src/SymTest.sol";
import {Test} from "forge-std/Test.sol";
import {MyToken} from "../src/MyToken.sol";

contract MyTokenTest is SymTest, Test {
    MyToken token;

    function setUp() public {
        uint256 initialSupply = svm.createUint256('initialSupply');
        token = new MyToken(initialSupply);
    }

    function check_transfer(address sender, address receiver, uint256 amount) public {
        // specify input conditions
        vm.assume(receiver != address(0));
        vm.assume(token.balanceOf(sender) >= amount);

        // record the current balance of sender and receiver
        uint256 balanceOfSender = token.balanceOf(sender);
        uint256 balanceOfReceiver = token.balanceOf(receiver);

        // call target contract
        vm.prank(sender);
        token.transfer(receiver, amount);

        // check output state
        assert(token.balanceOf(sender) == balanceOfSender - amount);
        assert(token.balanceOf(receiver) == balanceOfReceiver + amount);
    }
}
