// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract AdminAccess_ {
    string private name;
    uint rank;
    address public admin;

    modifier isadmin() {
        require(msg.sender == admin, "Only admin can access this operation");
        _;
    }

    constructor() {
        admin = msg.sender;
    }
    function setName(string memory _Name) public isadmin {
        name = _Name;
    }
    function getname() public view returns(string memory) {
        return name;
    }
    function setRank(uint _rank) public isadmin {
        rank = _rank;
    }
    function getrank() public view returns(uint) {
        return rank;
    }
}
