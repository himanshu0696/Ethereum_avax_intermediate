// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

contract CalculatorOfCube_{
    address public owner;

    mapping(address => uint) public balances;

    modifier isOwner() {
        require(msg.sender == owner, "Only Owner has the access.");
        _;
    }
    constructor() {
        owner = msg.sender;
    }

    function cube(uint nums) public pure returns(uint) {
        return nums * nums * nums;
    }
    function received() public payable {
        balances[msg.sender] += msg.value;
    }
    function getbalance() public view returns(uint) {
        return address(this).balance;
    }
}
