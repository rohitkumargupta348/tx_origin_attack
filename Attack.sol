// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract tx_origin{
    address public owner;

    constructor(address _owner){
        owner = _owner;
    }

    // receive() external payable {

    // }

    function sendether() public payable {

    }

    function withdrawAll(address payable _recipient) public {
        require(tx.origin == owner);
        _recipient.transfer(address(this).balance);
    }
}

//sender - withdrawAll
//Attacker - withdrawAll -Fail
//Attacker -> Phising Link ->
//Sender Call -> Attacker Smart Contract Function Call -> withdrawAll
//means attacker can not directly call the functions so it make a phising call
//and makes the sender click on his phising link which call the attacker functions and makes him the owner
//and the attacker can now withdraw all ethers
