// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract KeccakFirstCalldata {
    function main(uint256, uint256, uint256) external pure returns (bytes32) {
        assembly {
            // your code here
            // return the keccak hash of the FRIST argument in the calldata
            // Hint: use keccak256(offset, size)
            // Hint: don't forget to account for the offset
            // read this article for hints: https://www.rareskills.io/post/abi-encoding
            let val := and(calldataload(4) , 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff)
            mstore(0, val)
            mstore(32 , keccak256(0, 32))
            return(32 , 32)

        }
    }
}
