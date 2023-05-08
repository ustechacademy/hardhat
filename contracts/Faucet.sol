// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface IERC20{
    function transfer(address to, uint256 amount) external returns (bool);
}

contract Faucet {

    address payable owner;
    IERC20 public token;
    uint256 public amount = 100 * (10**18);
    uint256 public lockTime = 1 minutes;

    mapping(address => uint256) nextAccessTime;

    //0x11Ff38D1D029d85536B7ce8348c6843d59EFb818 -> 8 mayis 2023 21:32
    //0xC1125BcaFF1630DF97113ABBE5CaA60EC009b6e5 -> 9 Mayis 2023 20.31

    constructor(address tokenAddress) {
        // token
        token = IERC20(tokenAddress);
        owner = payable(msg.sender);
    }   

    function requestToken() public {
        //Olusturulmus olan ERC20 tokeni istekte bulunan kullanicinin cüzdanina yollayacagim.
        // msg.sender
        require(msg.sender != address(0),"Do not use zero address");
        require(block.timestamp >= nextAccessTime[msg.sender], "try 1 minute later");

        nextAccessTime[msg.sender] = block.timestamp + lockTime; // 8 mayis 2023 21:32

        // token transfer edilecek
        token.transfer(msg.sender,amount);
    }

    function setLockTime(uint256 timeInMinutes) public onlyOwner {
        lockTime = timeInMinutes * 1 minutes; 
    }

    function setAmount(uint256 _amount) public onlyOwner {
        amount = _amount * (10**18);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner");
        _; // function placeholder ->  setLockTime()
       
    }

}