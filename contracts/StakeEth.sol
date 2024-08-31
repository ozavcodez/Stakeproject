// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

contract StakeEth {
// Users should be able to stake Ether by sending a transaction to the contract.
// The contract should record the staking time for each user.
// Implement a reward mechanism where users earn rewards based on how long they have staked their Ether.
// The rewards should be proportional to the duration of the stake.
// Users should be able to withdraw both their staked Ether and the earned rewards after the staking period ends.
// Ensure the contract is secure, especially in handling users’ funds and calculating rewards.

// 10% reward over 30 days (in seconds)
uint private constant REWARD_RATE = 10;
uint private constant SECONDS_IN_30_DAYS = 30 * 24 * 60 * 60;

struct EthStake{
    uint amount;
    uint stakeTime;
}
mapping (address => EthStake) balance;


function StakeEther() public payable {
    require(msg.value > 0, "amount must greater than zero");
  balance[msg.sender] = EthStake({
    amount : msg.value,
    stakeTime: block.timestamp
  });
}

function reward(address _staker ){
     EthStake memory stake = balance[_staker];
     uint duration = block.timestamp * stake.stakeTime  * 30 days;
       // Calculate reward proportional to the staking duration
     uint reward = (stake.amount * REWARD_RATE * duration) / (SECONDS_IN_30_DAYS * 100);
    return reward;
}

function Withdraw() 
}