// SPDX-License-Identifier: GPL-3.0

// pragma solidity <=0.7.0;
pragma solidity >=0.8.0;

// Resource: https://www.youtube.com/watch?v=xv9OmztShIw&list=PLO5VPQH6OWdVQwpQfw9rZ67O6Pjfo6q-p&index=1

/*
- safeMath
- custom errors
- function outside contract
- import {symbol as alias} from filename
- Saleted contract creations / create2

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

        // 0.8 >=
        // This disable the error
        unchecked {
            num++;
        }
    }
}



