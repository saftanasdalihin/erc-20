// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.7.0
pragma solidity ^0.8.27;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Pausable} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol";
import {ERC20Permit} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract MyToken is ERC20, ERC20Pausable, Ownable, ERC20Permit {
    constructor(address recipient, address initialOwner)
        ERC20("MyToken", "MTK")
        Ownable(initialOwner)
        ERC20Permit("MyToken")
    {
        _mint(recipient, 1000000 * 10 ** decimals());
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    // The following functions are overrides required by Solidity.

    function _update(address from, address to, uint256 value) internal override(ERC20, ERC20Pausable) {
        super._update(from, to, value);
    }
}
