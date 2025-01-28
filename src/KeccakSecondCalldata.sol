// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract KeccakSecondCalldata {
    function main(uint256, uint256, uint256) external pure returns (bytes32) {
        assembly {
            // your code here
            // return the keccak hash of the SECOND argument in the calldata
            // Hint: use keccak256(offset, size)
            // solve KeccakFirstCalldata before this problem
            let val := and(calldataload(36) , 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff)
            mstore(0, val)
            mstore(32 , keccak256(0, 32))
            return(32 , 32)
        }
    }
}
