// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
import "hardhat/console.sol";

contract TryAttempt {
    function tryAttempt(address b) external {
        (bool s, ) = b.call(abi.encodeWithSignature("attempt()"));
        require(s);
    }
}