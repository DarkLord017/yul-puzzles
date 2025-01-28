// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract MaxOfArray {
    function main(uint256[] memory arr) external pure returns (uint256) {
        assembly {
            let fp := mload(0x40)
            // your code here
            // return the maximum value in the array
            // revert if array is empty
            for {let i := 32} iszero(gt(i, mul(mload(arr),32))) {i := add(i, 32)} {
                if gt(mload(add(arr, i)), mload(fp)) {
                    mstore(fp, mload(add(arr, i)))
                }
            }
            return(fp, 32)
        }
    }
}
