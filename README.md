# Base Subscription DApp

A simple subscription service smart contract deployed on the **Base** network. This project allows users to subscribe to a service by paying a small fee in ETH, which grants them access for a specific duration.

## Contract Details
- **Network:** Base Mainnet
- **Contract Address:** [0xF0ADe9B8FeDD11159F0cD0BDCb84B01bf2d2c711](https://basescan.org/address/0xF0ADe9B8FeDD11159F0cD0BDCb84B01bf2d2c711)
- **License:** MIT

## Features
- **Subscribe:** Users can pay `0.00001 ETH` to subscribe for 1 minute.
- **Verification:** The `isSubscribed` function checks if an address has an active, non-expired subscription.
- **Withdrawal:** The contract owner can withdraw all accumulated funds using the `withdraw` function.

## Functions
1. `subscribe()`: Call this to pay the subscription fee. Ensure you send at least `0.00001 ETH`.
2. `isSubscribed(address user)`: Returns `true` if the user has an active subscription.
3. `withdraw()`: Transfers the contract's balance to the owner's address (Owner only).

## How to Interact
1. Open the contract in [Remix IDE](https://remix.ethereum.org/).
2. Connect your wallet (e.g., Rabby or MetaMask) to the **Base Mainnet**.
3. Use the `subscribe` function and set the value to `0.00001 ETH`.

---
*Created for educational purposes.*
