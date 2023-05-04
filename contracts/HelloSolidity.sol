// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract HelloSolidity{
    
    string private greeting; // state variable -> blockchain storing

    constructor(string memory _greeting){
        greeting = _greeting;
    }

    function greet() public view returns(string memory){
        return greeting;
    }

    function setGreeting(string memory _greeting) public {
        greeting = _greeting;
    }

    function test() public pure returns(string memory){
        return "test";
    }
}