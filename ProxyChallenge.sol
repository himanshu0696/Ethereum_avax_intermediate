// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Proxypattern{
    address public execution;
    address public admin;
    address private _exec;

    constructor(address _execution) {
        execution = _execution;
        admin = msg.sender;
        _exec = execution;
    }
    modifier AdminOnly{
        require(msg.sender == admin, "Only admin can call.");
        _;
    }
    function upgrade(address _newExecution) external AdminOnly {
        _exec = _newExecution;
    }
    fallback() external payable {
        require(_exec != address(0));
        (bool success, ) = _exec.delegatecall(abi.encodePacked(msg.data)); 
        require(success);
    }
    receive() external payable{
        revert("fallback function is not payable right now.");
    }
}

contract BankExample{
    struct LocalUsers{
        string name;
        uint id;
    }
    mapping(address => LocalUsers) public user;
    function setdetails(string memory name, uint id) external {
        user[msg.sender] = LocalUsers(name, id);
    }
    function getdetails(address user_) external view returns(string memory, uint) {
        return(user[user_].name, user[user_].id);
    }
}
