// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

contract ViewandPure{
    uint public variable;

    constructor() {
        variable = 144;
    }
    function getvariable() public view returns(uint) {
        return variable;
    }
    function multiply(uint _a, uint _b) public pure returns(uint) {
        return _a * _b;
    }
}
