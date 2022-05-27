// SPDX-License-Identifier: GPL-3.0

// pragma solidity <=0.7.0;
pragma solidity ^0.8;

// Resource: https://www.youtube.com/watch?v=xv9OmztShIw&list=PLO5VPQH6OWdVQwpQfw9rZ67O6Pjfo6q-p&index=1

/*
- safeMath
- custom errors
- function outside contract
- import {symbol as alias} from filename
- Salted contract creations / create2

*/

/*
Before 0.8, 
Number smaller then min number wraps around max value and vice versa
for EX: 
uint8 x = -1 returns 255
uint8 x = 256 returns 0

From 0.8 
above EX gives ERROR
you can use 
`unchecked` to disable this error

*/

contract safeMath {
    function testUnderFlow() public pure returns (uint8 num) {
        num = 0;
        num--;
    }

    function testOverFlow() public pure returns (uint8 num) {
        num = 255;
        num++;

        // 0.8 <=
        // This disable the error for lower version not recommended
        unchecked {
            num++;
        }
    }
}

/* Custome Error
Why?
- returning string will cost you more GAS 
- The amout of gas depends on the lenght of the message

 */

contract CustomError {
    address payable owner = payable(msg.sender); // deployer

    // error UNAUTHORIZED(); // works with version 0.8.6 or above so select accordingliy

    // Use this as a event as well

    error UNAUTHORIZED(address caller);

    function withdraw() public {
        if(msg.sender != owner) {
            // Cost around 23613 
            // revert("SOME BIG ERROR"); 

            // Cost around 23692
            // revert("SOME BIG ERROR AND I AM FUCKED UP SO WHAT ");

            // Cost around 23388 | cheaper 
            revert UNAUTHORIZED(msg.sender);

        } 
        owner.transfer(address(this).balance);
    }
}

/*
we can decalet CUSTOM ERROR & Function outside the contract so we
can use it 
*/

/* 
Create Function outside Contract
*/


function CalculateFee(uint x) pure returns(uint fee){
    fee = x * 10;
}


contract buyMePizza{
    function checkout() public pure returns(uint pizza){
        pizza = CalculateFee(20);
    }
}


// 




