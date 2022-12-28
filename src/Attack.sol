// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "../src/FloraToken.sol";

contract Attack {

    FloraToken public floratoken;
    
    constructor() payable {
        require(msg.value == 1 ether);
        floratoken = new FloraToken{ value : 1 ether}();
    }

    /** */

    function mint(address _user, uint256 _amount) external {
        floratoken.mintFor(_user,_amount);

    }

    function delegate(address _secondAddress) external {
        floratoken.delegate(_secondAddress);
    }

    function transferOwnership(address _user) external {
        floratoken.transferOwnership(_user);
    }

}

 