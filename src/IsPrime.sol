// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract IsPrime {
    function main(uint256 x) external pure returns (bool) {
       assembly {
    // If the number is less than 2, return false
    if lt(x, 2) {
        mstore(0, 0)
        return(0, 32)
    }
    
    // If the number is 2 or 3, return true
    if or(eq(x, 2), eq(x, 3)) {
        mstore(0, 1)
        return(0, 32)
    }
    
    // If the number is even, return false
    if eq(and(x, 1), 0) {
        mstore(0, 0)
        return(0, 32)
    }
    
    // Check divisibility by 3
    if eq(mod(x, 3), 0) {
        mstore(0, 0)
        return(0, 32)
    }
    
    // Loop from 5 to x / 2 to check divisibility
    let i := 5
    for {} lt(i, div(x, 2)) {} {
        i := add(i, 2) // Increment by 2 to skip even numbers
        if eq(mod(x, i), 0) {
            mstore(0, 0)
            return(0, 32)
        }
    }
    
    // If no divisors are found, the number is prime
    mstore(0, 1)
    return(0, 32)
}

    }
}
