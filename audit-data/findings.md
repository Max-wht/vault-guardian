## HIGH

### [H-1] `VaultShares::divestThenInvest()` Liquidity Removal Followed by Re-Deposit Is Vulnerable to MEV Sandwich Attacks.

**Description:** `VaultShares::divestThenInvest()` The contract removes liquidity from an AMM pool and immediately performs swaps and liquidity re-deposits within the same transaction.Although the operations are atomic at the contract level, the transaction itself is publicly visible before execution and can be reordered within a block. MEV searchers can front-run and back-run this transaction to manipulate the pool price during execution.

**Impact:**

- The contract executes swaps at manipulated prices
- Liquidity is re-added at unfavorable ratios
- Value is extracted by MEV bots
- The contract (or vault users) suffer deterministic losses

**Recommended Mitigation:**

- Do not remove 100% of liquidity before performing swaps
- use off-chain oracle instead of on-chain AMM

### [H-2]`UniswapAdapter` Missing Slippage Protection in Liquidity Removal and Swap Enables MEV Extraction.

**Description:** the `_uniswapDivest` function removes liquidity from Uniswap V2 Pool and subsequently swap the recived token back to target address. `Both removeLiquidity` and `swapExactTokensForTokens` are executed with slippage parameters set to zero (amountAMin = 0, amountBMin = 0, amountOutMin = 0).

**Impacts:**

- Liquidity may be removed at manipulated prices
- Token swaps can execute with extreme slippage
- Vault or protocol funds may suffer consistent losses

**Recommended Mitigation:**

- Enforce non-zero `amountAMin` and `amountBMin` when calling `removeLiquidity`

### [H-3]`UniswapAdapter::_uniswapDivest()`Missing Approving partyToken to the Vault before Swapping partyToken to Vault's Asset. This means that Vualt will never recived actual Asset.

**Description:**The `_uniswapDivest` function performs a token swap using swapExactTokensForTokens, which requires the Uniswap router to have sufficient allowance for the input token.
However, the function relies on a direct approve call immediately before the swap, without resetting the allowance or using a safe approval pattern.

**impacts:** `_uniswapDivest` always reverts, because of `ERC20InsufficientAllowance`

**Recommended Mitigation:**

change the `UniswapAddapter.sol`

```diff
+ counterPartyToken.approve(
+    address(i_uniswapRouter),
+    counterPartyTokenAmount
+ );

```

## MEDIUM

## LOW

## GAS

## INFO

### [I-1]`IInvestableUniverseAdapter` and `IVaultGuardians`interfaces is empty and no one use the interface

**Discription** there are empty. you would better add some function to them, reprecenting the role of InvestableUniverseAdapter and VaultGuardians
