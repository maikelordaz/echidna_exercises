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

    // Exercise 4
    function transfer(address to, uint256 value) public override {
        // Solution to exercise 4
        uint256 initial_balance_from = balances[msg.sender];
        uint256 initial_balance_to = balances[to];

        // Original exercise 4 code
        super.transfer(to, value);

        // Solution to exercise 4
        assert(balances[msg.sender] <= initial_balance_from);
        assert(balances[to] >= initial_balance_to);
    }
}
