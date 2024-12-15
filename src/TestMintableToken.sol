pragma solidity ^0.8.0;

import "src/MintableToken.sol";

contract TestToken is MintableToken {
    address echidna = msg.sender;

    // TODO: update the constructor
    constructor(int256 totalMintable) MintableToken(totalMintable) {}

    function echidna_test_balance() public view returns (bool) {
        // TODO: add the property
    }
}
