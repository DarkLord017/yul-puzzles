// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReadFromDoubleMapping {
    mapping(address user => mapping(address token => uint256)) public balances;

    function setValue(address user, address token, uint256 value) external {
        balances[user][token] = value;
    }

    function main(address user, address token) external view returns (uint256) {
        assembly {
            // your code here
            // read and return the `token` balance of `user` in the double mapping `balances`
            // Hint: https://www.rareskills.io/post/solidity-dynamic
            mstore(0, user)
            mstore(64, token)
            mstore(32, balances.slot)
            mstore(96,  keccak256(0, 0x40))
            let v := sload(keccak256(64, 0x40))
            mstore(128, v)
            return(128, 0x20)
        }
    }
}
