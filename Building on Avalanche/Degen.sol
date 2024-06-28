// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "hardhat/console.sol";

contract DEGENTOKEN is ERC20, Ownable {
    // stores items mapping(item id => item costs in token)
    mapping(uint256 => uint256) itemcosts;

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender){
        itemcosts[1] = 150; // item1 costs 150 tokens
        itemcosts[2] = 260; // item2 costs 260 tokens
        itemcosts[3] = 440; // item3 costs 440 tokens
    }

    function Mint(address to, uint256 amount) public onlyOwner{
        _mint(to, amount);
    }
    // reedeming the token for items
    function Reedem(uint256 itemid) public {
        uint256 itemCost = itemcosts[itemid];
        require(itemCost > 0, "Item does not exist");
        require(balanceOf(msg.sender) >= itemCost);

        _transfer(msg.sender, address(this), itemCost);
        emit Reedemeditem(msg.sender, itemid);
    }
    // burn tokens
    function Burn(uint256 amount) public{
        _burn(msg.sender, amount);
    }

    event Reedemeditem(address indexed player1, uint256 indexed itemid);
}
