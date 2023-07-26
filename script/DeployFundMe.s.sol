//SPDX-License-Identifier: MIT

pragma solidity 0.8.20;
import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    FundMe fundMe;

    function run() external returns (FundMe) {
        HelperConfig helperConfig = new HelperConfig();
        address networkAddress = helperConfig.activeNetwork();

        vm.startBroadcast();
        fundMe = new FundMe(networkAddress);
        vm.stopBroadcast();
        return fundMe;
    }
}
