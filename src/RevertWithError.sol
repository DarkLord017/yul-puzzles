// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract RevertWithError {
    function main() external pure {
        assembly {
            // revert the function with an error of type `Error(string)`
            // use "RevertRevert" as error message
            // Hint: The error type is a predefined four bytes. See https://www.rareskills.io/post/try-catch-solidity

            //The selector 08c379a0 is the first four bytes of keccak256("Error(string)") where string refers to the reason string. The next 96 bytes (3 lines) are the ABI encoding of the string
           mstore(0, 0x08c379a0) //keccak256("Error(string)")
           ///ABI encoding of the string
           mstore(32 , 32)//offset to length of the string
           mstore(64, 12) //length of the string
           mstore(96, "RevertRevert")
           revert(28 , 128)
           ///////
        }
    }
}
