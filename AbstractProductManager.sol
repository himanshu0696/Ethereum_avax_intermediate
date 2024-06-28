// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

interface IPRODUCTS{
    function additem(string calldata _items) external;
    function getitem(uint256 index) external view returns(string memory);
}

abstract contract ProductManager{
    string[] internal items;

    function getCount() public view returns(uint256) {
        return items.length;
    }
    function additem(string memory _items) public virtual;
}

contract PRODUCTS is IPRODUCTS, ProductManager {
    function additem(string memory _items) public override(ProductManager, IPRODUCTS){
        items.push(_items);
     }
    function getitem(uint256 index) public view override returns (string memory) {
        require(index < items.length, "Out of bounds");
        return items[index];
    }
}
