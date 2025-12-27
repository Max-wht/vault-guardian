## TREE

1. `VaultShares.sol`

```js
    1. function setNotActive() public onlyVaultGuardians isActive

    2. function updateHoldingAllocation(
        AllocationData memory tokenAllocationData
    ) public onlyVaultGuardians isActive

    3. function deposit(
        uint256 assets,
        address receiver
    )
        public
        override(ERC4626, IERC4626)
        isActive
        nonReentrant
        returns (uint256)
```

## Q

1. how many vaults in the system? every Guardian will build a vault?

2. if the vaultName and vaultSymbol are collision?
