// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {Test} from "forge-std/Test.sol";
import {MyToken} from "../src/erc-20.sol";

contract MyTokenTest is Test {
    MyToken public token;

    function setUp() public {
        token = new MyToken(address(this), address(this));
    }

    function testOwnerAndInitialSupply() public {
        assertEq(token.owner(), address(this));
        assertEq(token.totalSupply(), 1000000 * 10 ** token.decimals());
    }

    function testPauseAndUnpause() public {
        token.pause();
        assertTrue(token.paused());
        vm.expectRevert();
        token.transfer(address(0x1), 1); // This should revert due to pause

        token.unpause();
        assertFalse(token.paused());
        token.transfer(address(0x1), 1); // This should succeed after unpause
    }

    function testOnlyOwnerCanPause() public {
        address nonOwner = address(0x2);
        vm.prank(nonOwner);
        vm.expectRevert();
        token.pause(); // This should revert since nonOwner is not the owner
    }
}
