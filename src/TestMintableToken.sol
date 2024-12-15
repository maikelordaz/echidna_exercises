pragma solidity ^0.8.0;

import "src/MintableToken.sol";

contract TestMintableToken is MintableToken {
    address echidna = msg.sender;

    // TODO: update the constructor
    constructor() MintableToken(10_000) {
        owner = echidna;
    }

    function echidna_test_balance() public view returns (bool) {
        return balances[msg.sender] <= 10_000;
    }
}
