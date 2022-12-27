// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.0;

import "../src/FloraToken.sol";
import "forge-std/Test.sol";

contract FLoraAttack is Test {

    /*///////////////////////////////////////////////////////////////
                          ACTORS                       
    //////////////////////////////////////////////////////////////*/

    address _owner = address(1);
    address challenger = address(2);
    address attacker = address(3);

    ///Address flora token of type FloraToken///

    FloraToken public floratoken;

    // Sets up the contract with "mint(uint256)" and mintFor(address,uint256)" already called by "_owner"
    //** @notice "_owner" mints 100 tokens to "challenger"

    function setUp() public {
        vm.deal(_owner,1 ether);
        vm.startPrank(_owner);
        floratoken = new FloraToken{value : 1 ether}();
        floratoken.mint(100);
        floratoken.mintFor(challenger,100);
        vm.stopPrank();
    }
    

    function testDelegate() external {
        vm.prank(attacker);
        floratoken.delegate(challenger);

    }

}