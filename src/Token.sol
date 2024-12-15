pragma solidity ^0.8.0;

contract Ownable {
    address public owner = msg.sender;

    // Original exercise 2 code
    // Solution exercise 2 code remove this lines
    // function Owner() public {
    //     owner = msg.sender;
    // }

    // Original exercise 4 code
    function transferOwnership(address newOwner) public onlyOwner {
        owner = newOwner;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Ownable: Caller is not the owner.");
        _;
    }
}

contract Pausable is Ownable {
    bool private _paused;

    function paused() public view returns (bool) {
        return _paused;
    }

    function pause() public onlyOwner {
        _paused = true;
    }

    function resume() public onlyOwner {
        _paused = false;
    }

    modifier whenNotPaused() {
        require(!_paused, "Pausable: Contract is paused.");
        _;
    }
}

contract Token is Ownable, Pausable {
    mapping(address => uint256) public balances;

    function transfer(address to, uint256 value) public virtual whenNotPaused {
        // Original exercise 1 and 4 code
        unchecked {
            balances[msg.sender] -= value;
            balances[to] += value;
        }

        // Solution to exercise 1
        // balances[msg.sender] -= value;
        // balances[to] += value;
    }
}
