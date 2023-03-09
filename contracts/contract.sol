// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Marketplace {
    enum ShippingStatus { Pending, Shipped, Delivered }
    ShippingStatus public status;
    address public owner;
    address public customer;
    
    event MisionComplete(string message);

    modifier ownerOnly() 
    {
        require(msg.sender == owner, "Only the owner can call this function.");
        _;
    }
    
    modifier customerOnly() 
    {
        require(msg.sender == customer, "Only the customer who paid with ether can call this function.");
        _;
    }

    constructor()
    {
        status = ShippingStatus.Pending;
        owner = msg.sender;
    }
    
    function Shipped() public ownerOnly 
    {
        status = ShippingStatus.Shipped;
        emit MisionComplete("The package has been shipped.");
    }
    
    function Delivered() public ownerOnly 
    {
        status = ShippingStatus.Delivered;
        emit MisionComplete("The package has been delivered.");
    }
    
    function getStatus() public view ownerOnly returns (ShippingStatus) 
    {
        return status;
    }
    
    function Status() public view customerOnly returns (ShippingStatus) 
    {
        return status;
    }
}
