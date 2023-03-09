// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MarketplaceToken {
    
    // Enum to list the possible shipping statuses
    enum ShippingStatus { 
        Pending, 
        Shipped, 
        Delivered 
    }

    // Private state variable to store the current shipping status
    ShippingStatus private status;

    // Address of the contract owner and customer
    address private owner;
    address private customer;

    // Event emitted when the item is delivered
    event MissionComplete(string message);

    /**
    * Constructor used to initialize the contract state
    * Takes a address as a parameter for the customer
    */
    constructor(address _customer) {
        owner = msg.sender; // The owner is the one creating the contract, so take the address of the creator for the owner
        customer = _customer;
        status = ShippingStatus.Pending;
    }

    /**
    * Modifier used to restrict a function to the contract owner
    */
    modifier ownerOnly() {
        require(msg.sender == owner, "Only owner can perform this action");
        _; // Underscore placeholder, where the code will be inserted when you apply the modifier
    }

    /**
    * Modifier to restrict a function to the customer who made the order
    */
    modifier customerOnly() {
        require(msg.sender == customer, "Only customer can perform this action");
        _; // Underscore placeholder, where the code will be inserted when you apply the modifier
    }

    /**
    * Function used to update the shipping status to "SHIPPED"
    * Restricted to owner call only via the modifier ownerOnly
    */
    function shipped() public ownerOnly {
        require(status == ShippingStatus.Pending, "Item has already been shipped or delivered");
        status = ShippingStatus.Shipped;
        emit MissionComplete("Item has been shipped");
    }

    /**
    * Function used to update the shipping status to "DELIVERED"
    * Restricted to owner call only via the modifier ownerOnly
    */
    function delivered() public ownerOnly {
        require(status == ShippingStatus.Shipped, "Item has not been shipped yet");
        status = ShippingStatus.Delivered;
        emit MissionComplete("Item has been delivered");
    }

    /**
    * Function used to get the current shipping status
    * View to restrict it to view-only (read-only)
    * Restricted to owner call only via the modifier ownerOnly
    */
    function getStatus() public view ownerOnly returns (ShippingStatus) {
        return status;
    }

    /**
    * Function used to check the shipping status
    * Restricted to the customer who made the order via the modifier customerOnly
    * Requires payment of ether to access this information
    */
    function checkStatus() public customerOnly payable returns (ShippingStatus) {
        require(msg.value > 0, "Please pay to check the status of your order");
        return status;
    }
}
