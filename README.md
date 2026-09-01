# ERC-20 Token with Ownership and Pausable Functionality

A minimal ERC-20 token implementation built with OpenZeppelin contracts and tested using Foundry.

This project demonstrates the integration of three standard OpenZeppelin components:

* `ERC20` — standard token functionality
* `Ownable` — ownership and access control
* `Pausable` — emergency pause mechanism

The project does not reimplement these standard primitives. Instead, it integrates OpenZeppelin's established implementations and verifies the expected behavior through a Foundry test suite.

## Features

### ERC-20

The contract implements the standard ERC-20 interface, including:

* Token transfers
* Allowances
* `transferFrom`
* Balance tracking
* Total supply tracking

### Ownership

The contract uses OpenZeppelin's `Ownable` module to define a single owner with privileged access.

The owner is responsible for administrative operations such as pausing and unpausing the token.

### Pausable

The contract includes an emergency pause mechanism.

When the contract is paused, token transfers are blocked. The owner can unpause the contract to restore normal transfer functionality.

## Architecture

The contract combines OpenZeppelin's standard modules:

```text
ERC20
  │
  ├── Token functionality
  │
Ownable
  │
  └── Administrative access
  │
Pausable
  │
  └── Emergency pause mechanism
```

The contract's custom logic is primarily focused on integrating these modules rather than reimplementing their underlying mechanisms.

## Access Control

The contract follows a simple single-owner access model.

| Operation                | Permission         |
| ------------------------ | ------------------ |
| Transfer tokens          | Anyone             |
| Approve allowance        | Anyone             |
| Transfer using allowance | Authorized spender |
| Pause contract           | Owner only         |
| Unpause contract         | Owner only         |
| Transfer ownership       | Owner only         |

Ownership can be transferred using the functionality provided by OpenZeppelin's `Ownable` implementation.

## Pause Behavior

When the contract is paused:

* Token transfers are blocked.
* Functions that depend on token transfer execution are expected to respect the paused state.
* Only the owner can restore normal operation by calling `unpause()`.

The purpose of the pause mechanism is to provide an administrative emergency control rather than to modify the ERC-20 token model itself.

## Security Considerations

This project relies on OpenZeppelin's standard implementations for the ERC-20, ownership, and pausing primitives instead of maintaining custom implementations of these mechanisms.

The test suite therefore focuses primarily on verifying that these components are integrated correctly and that the intended contract behavior is enforced.

In particular, the tests verify:

* Initial ownership
* Token transfers
* Allowance behavior
* Restricted owner-only functions
* Ownership transfer
* Pausing and unpausing
* Transfer behavior while paused

This project does not claim that the use of OpenZeppelin alone guarantees that the entire contract is secure. Application-specific logic, configuration, integrations, and future modifications must still be reviewed and tested.

## Testing

The project uses [Foundry](https://book.getfoundry.sh/) for testing.

The test suite verifies both standard ERC-20 behavior and the integration of ownership and pausing functionality.

Run the test suite with:

```bash
forge test
```

For more detailed output:

```bash
forge test -vv
```

## Project Structure

```text
.
├── src/
│   └── MyToken.sol
├── test/
│   └── MyToken.t.sol
├── foundry.toml
└── README.md
```

## Limitations

This project intentionally keeps the token design simple.

It does not include:

* Custom tokenomics
* Minting mechanisms
* Burning mechanisms
* Role-based administration
* Upgradeability
* Staking
* Vesting
* Governance
* Multi-signature administration

These features would introduce additional business logic and security considerations beyond the scope of this implementation.

## Purpose

The primary purpose of this project is to demonstrate the ability to:

1. Integrate established OpenZeppelin contract modules.
2. Understand their interaction within a single contract.
3. Define and enforce administrative permissions.
4. Implement an emergency pause mechanism.
5. Write and execute a Foundry-based test suite.

## License

This project is provided for educational and demonstration purposes.
