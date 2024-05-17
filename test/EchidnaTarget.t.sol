// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

import "../src/EchidnaTarget.sol";

contract EchidnaTargetTest is Token {
    address echidna = tx.origin;

    constructor() {
        balances[echidna] = 10_000;
    }

    function echidna_test_balance() public view returns (bool) {
        return balances[echidna] <= 10_000;
    }
}
