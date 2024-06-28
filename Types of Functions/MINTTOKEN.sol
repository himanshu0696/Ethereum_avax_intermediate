// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

// import OpenZepplin's ERC20 and ownable contracts
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MINTTOKEN is ERC20 {
    address private owner;

    // constructor that intializes the name and symbol of a ERC20 token
    constructor() ERC20("Ethereum", "Eth"){
        owner = msg.sender;

        //mint an initial supply of 80 token to deployer's address
        _mint(owner, 80 * 10**decimals());
    }

    // only owner can call this function
    modifier onlyOwner() {
        require(owner == msg.sender);
        _;
    }

    // mint function can called by owner only
    function MINT(address to, uint amnt) public onlyOwner {
        _mint(to, amnt);
    }

    // burn function can be called by any user to destroy their own tokens
    function BURN(uint amnt) public {
        _burn(msg.sender, amnt);
    }

    // transfer function allows any user to transfer the token to the another address
    function transfer(address to, uint amnt) public override returns (bool) {
        require(to != address(0), "Transferring to address zero is not applicable.");
        require(amnt > 0, "Amount should be greater than 0 in case of transferring.");

        // using transfer function from ERC20
        _transfer(msg.sender, to, amnt);
        return true;
    }

    // to get the token name
    function getTokenname() public view returns (string memory) {
        return name();
    }
    // to get token symbol
    function getTokensymbol() public view returns(string memory) {
        return symbol();
    }
    // to get token decimal
    function getTokendecimal() public view returns (uint) {
        return decimals();
    }
    // to get total no. of tokens in circulation
    function getTotal() public view returns(uint) {
        return totalSupply();
    }
} 
