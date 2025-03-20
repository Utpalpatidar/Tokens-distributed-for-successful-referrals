// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReferralProgram {
    mapping(address => address) public referrals;
    mapping(address => uint256) public rewards;
    address public owner;
    uint256 public rewardAmount = 10; // Fixed token reward

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    function registerReferral(address referrer) public {
        require(referrals[msg.sender] == address(0), "Already referred");
        require(referrer != msg.sender, "Cannot refer yourself");

        referrals[msg.sender] = referrer;
        rewards[referrer] += rewardAmount;
    }

    function getRewardBalance(address user) public view returns (uint256) {
        return rewards[user];
    }
}
