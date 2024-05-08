// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Quadratic.sol";
import "./handlers/QuadraticHandler.sol";

contract InvariantQuadratic is Test {
    Quadratic quadratic;
    QuadraticHandler handler;

    function setUp() external {
        quadratic = new Quadratic();
        handler = new QuadraticHandler(quadratic);

        targetContract(address(handler));
    }

    /// forge-config: default.invariant.runs = 512
    function invariant_NotOkay() external {
        assertTrue(quadratic.ok());
    }
}