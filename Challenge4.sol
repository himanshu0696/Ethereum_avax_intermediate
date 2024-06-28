// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

contract TrackerOfEther_ {
    address public owner;
    mapping(address => uint)public Etherbalances;

    constructor() {
        owner = msg.sender;
    }

    function received() external payable {
        Etherbalances[msg.sender] += msg.value;
    }
    function getbalance()  external view returns(uint) {
        return address(this).balance;
    }
    function withdraw()external {
        require(msg.sender == owner);
        payable(owner).transfer(address(this).balance);
    }
    function getUserdueBalance(address _user)external view returns(uint) {
        return Etherbalances[_user];

    }
}
