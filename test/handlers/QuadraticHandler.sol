// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "../../src/Quadratic.sol";
import "forge-std/Test.sol";

contract QuadraticHandler is Test {
    Quadratic quadratic;

    constructor(Quadratic _quadratic) {
        quadratic = _quadratic;
    }

    function notOkay(int x) external {
        x = bound(x, 10_000, 100_000);
        quadratic.notOkay(x);
    }
}