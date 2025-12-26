// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {IERC4626} from "@openzeppelin/contracts/interfaces/IERC4626.sol";
import {IVaultData} from "./IVaultData.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IVaultShares is IERC4626, IVaultData {
    struct ConstructorData {
        IERC20 asset;
        string vaultName;
        string vaultSymbol;
        address guardian;
        AllocationData allocationData;
        address aavePool;
        address uniswapRouter;
        uint256 guardianAndDaoCut;
        address vaultGuardians;
        address weth;
        address usdc;
    }

    function updateHoldingAllocation(
        AllocationData memory tokenAllocationData
    ) external;

    function setNotActive() external;

    //@note IERC4626 is the OpenZeppelin standard interface for ERC-4626
    /**
     * 这是 OpenZeppelin 的 ERC-4626 标准接口，提供了：
     *function deposit() - 存入资产，获得份额代币
     * function withdraw() - 赎回份额代币，取回资产
     * function mint() - 铸造指定数量的份额代币
     * function redeem() - 销毁份额代币，取回资产
     * function totalAssets() - 金库管理的总资产
     * function convertToShares() / convertToAssets() - 份额和资产的转换
     */
}
