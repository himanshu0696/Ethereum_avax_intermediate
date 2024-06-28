// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

contract Sum_of_Squares{
    // storage variable
    uint public results;

    function calculatesqaures(uint i, uint j) public {
        // memory variable
        uint square1 = i * i;
        uint square2 = j * j;

        results = square1 + square2;
    }
}
