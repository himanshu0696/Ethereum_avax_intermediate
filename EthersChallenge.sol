// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Wallet{
    address public owner;

    event receivedEther(address indexed from, uint amount);
    event fallbackCalled(address indexed from, uint amount, bytes data);

    modifier Owneronly{
        require(msg.sender == owner);
        _;
    }
    constructor(){
       owner = msg.sender;
    }
    receive() external payable {
        emit receivedEther(msg.sender, msg.value);
    }
    fallback() external payable {
        emit fallbackCalled(msg.sender, msg.value, msg.data);
    }
    function _Withdrawbalances() external Owneronly {
        payable(owner).transfer(address(this).balance);
    }
    function getbalanceof(address _add) external view returns(uint) {
        return _add.balance;
    }
}
