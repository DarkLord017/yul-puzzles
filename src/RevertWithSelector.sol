// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract RevertWithSelector {
    error RevertData(); // selector: 0xa3b7e096

    function main() external pure {
        assembly {
            // your code here
            // revert with the custom error "RevertData"
            // do the Solidity equivalent of
            // `revert RevertData()`
            // but in assembly
            // hint: https://www.rareskills.io/post/assembly-revert
            mstore(0 , 0xa3b7e096)
            revert(28 , 4)
           
        }
    }
}
