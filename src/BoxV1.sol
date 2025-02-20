// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";


contract BoxV1 is  Initializable , UUPSUpgradeable  , OwnableUpgradeable {
    uint256 internal number;


    //We cant use a constructor in a proxy
    // constructor() {
    //     _disableInitializers();
    // }
    
    //This function now acts as our constructor
    function initialize() public initializer {
        __Ownable_init(); // sets owner to msg.sender
        __UUPSUpgradeable_init();
    }

    function getNumber() external view returns (uint256) {
        return number;
    }

    function version() external pure returns (uint256) {
        return 1;
    }

    function _authorizeUpgrade(address newImplementation) internal override {}
}