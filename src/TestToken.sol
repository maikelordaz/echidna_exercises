pragma solidity ^0.8.0;

import "src/Token.sol";

contract TestToken is Token {
    address echidna = msg.sender;

    constructor() {
        // Exercise 1
        balances[echidna] = 10_000;

        // Exrcise 2
        pause(); // pause the contract
        owner = address(0); // lose ownership
    }

    // Exercise 1
    function echidna_test_balance() public view returns (bool) {
        return balances[echidna] <= 10000;
    }

    // Exercise 2
    function echidna_cannot_be_unpause() public view returns (bool) {
        return paused() == true;
    }
}
