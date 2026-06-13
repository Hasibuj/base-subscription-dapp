// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SubscriptionService {
    struct Subscription {
        uint256 expiryTime;
        bool isActive;
    }

    mapping(address => Subscription) public subscriptions;
    uint256 public constant FEE = 0.00001 ether;
   uint256 public constant DURATION = 1 minutes;
  
    address public owner;

    event Subscribed(address indexed user, uint256 expiry);
    event Withdrawn(uint256 amount);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Unauthorized");
        _;
    }

    function subscribe() external payable {
        require(msg.value >= FEE, "Insufficient ETH");
        
        uint256 expiry = block.timestamp + DURATION;
        subscriptions[msg.sender] = Subscription({
            expiryTime: expiry,
            isActive: true
        });
        
        emit Subscribed(msg.sender, expiry);
    }

    function isSubscribed(address user) external view returns (bool) {
        return subscriptions[user].isActive && subscriptions[user].expiryTime > block.timestamp;
    }

    function withdraw() external onlyOwner {
        uint256 balance = address(this).balance;
        require(balance > 0, "No balance");
        
        (bool success, ) = payable(owner).call{value: balance}("");
        require(success, "Transfer failed");
        
        emit Withdrawn(balance);
    }
}
