// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

import "forge-std/Test.sol";
import "../src/ExampleContract.sol";

contract InvariantExampleContract1Test is Test {

    ExampleContract exampleContract;

    function setUp() external {
        exampleContract = new ExampleContract();
    }

    function invariant_A() external {
        assertEq(exampleContract.val1() + exampleContract.val2(), exampleContract.val3());
    }

    function invariant_B() external {
        assertGe(exampleContract.val1() + exampleContract.val2(), exampleContract.val3());
    }

}