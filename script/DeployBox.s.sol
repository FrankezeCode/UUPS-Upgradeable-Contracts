// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {BoxV1} from "src/BoxV1.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

contract DeployBox is Script {
    function run() external returns (address) {

        address proxy = deployBox();
        return proxy;
    }


    function deployBox() public returns (address) {
        vm.startBroadcast();
        BoxV1  box = new BoxV1(); // implementation (Logic)
        ERC1967Proxy proxy = new ERC1967Proxy(address(box), "");//the proxy points to boxV1
        vm.stopBroadcast();
        return address(proxy);
    }
}