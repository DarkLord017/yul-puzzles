// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteToDynamicArray {
    uint256[] writeHere;

    function main(uint256[] memory x) external {
         assembly {
            let slot := writeHere.slot
            let len := mload(x)
            let initialLength := sload(slot)
            let newLength := add(initialLength, len)
            
            // Store new length
            sstore(slot, newLength)
            
            // Calculate array data position 
            mstore(0x00, slot)
            let dataSlot := keccak256(0x00, 0x20)
            
            // Store new elements after existing ones
            for { let i := 0 } lt(i, len) { i := add(i, 1) } {
                let value := mload(add(add(x, 0x20), mul(i, 0x20)))
                sstore(
                    add(dataSlot, add(initialLength, i)),
                    value
                )
            }
    }
    }

    function getter() external view returns (uint256[] memory) {
        return writeHere;
    }
}
