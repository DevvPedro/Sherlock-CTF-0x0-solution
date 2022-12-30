//SPDX-License-Identifier: Unlicensed

pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/Attack.sol";


contract AttackTest is Test {

    /*//////////////////////
            ACTORS
    ////////////////////////*/
    address _owner = address(1);
    address _user =  address(2);
    address secondAddress = address(3);

    Attack attack;

    /** @notice deploys an instance of the attack contract */
    /**@dev 100 tokens have been minted to address(_user) */

    function setup() external {
      vm.deal(_owner, 1);
      vm.Startprank(_owner);
      attack = new Attack{value : 1 ether}();
      attack.mint(_user,100);
    }

    /** @notice tests the delegate and transferOwnership function */

    function testAttack() external  {
      vm.prank(_user);
      attack.delegate(secondAddress);
      vm.prank(secondAddress)
      attack.transferOwnership(_user);  
    }

}