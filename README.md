# Ready to be a winner?

## Goal: Emit the Winner event

Your goal is simple! Emit the winner event on this smart contract on the Goerli testnet: https://goerli.etherscan.io/address/0xcF469d3BEB3Fc24cEe979eFf83BE33ed50988502#code

If you take a look at the Code tab in Etherscan, you'll see that the source code for this contract looks like this:

```
// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Contract {
    event Winner(address);

    function attempt() external {
        require(msg.sender != tx.origin, "msg.sender is equal to tx.origin");
        emit Winner(msg.sender);
    }
}
```

How do we possibly make it so the tx.origin (the EOA who originated the transaction) is not equal to the msg.sender? 🤔

We'll leave that challenge up to you!

## Solution

I did this on Sepolia instead of Goerli, which means I had to deploy the above `Contract` to Sepolia first. Then to complete the task I created another contract which can call the `attempt` function on `Contract.sol`, so that the `msg.sender` != `tx.origin`.  

This is because the `tx.origin` global variable refers to the original external account that started the transaction while `msg.sender` refers to the immediate account (it could be external or another contract account) that invokes the function.  

- `Contract.sol` was deployed to [0x4d8382F7C073d096B3f2664398A2B1527ECD5c76](https://sepolia.etherscan.io/tx/0x9b393c4dcef48e9a73e2e1e270cdc62b55071fe604e71d6c8363173419911de0)
- `TryAttempt.sol` was deployed to [0xA47263A75D7FebecEb32421f920D27d15dbAae4f](https://sepolia.etherscan.io/tx/0xa43bdcb5d83f01f68a91b920a5caf395f277d77a19bf21b3da4df68fbf168f99)
- `Contract.sol#events` shows [the emitted `Winner` event](https://sepolia.etherscan.io/address/0x4d8382f7c073d096b3f2664398a2b1527ecd5c76#events)
- The emitted event transaction hash [0x2717f4f6b1429b164eab0e3ac4a9a329380242edcefe78460a2a8556a42a7a73](https://sepolia.etherscan.io/tx/0x2717f4f6b1429b164eab0e3ac4a9a329380242edcefe78460a2a8556a42a7a73)