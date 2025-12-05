// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {CeloLearningNFT} from "../src/CeloLearningNFT.sol";

contract DeployCeloLearningNFT is Script {
    function run() external {
        vm.startBroadcast();

        // Deploy the contract
        CeloLearningNFT nft = new CeloLearningNFT("Celo Learning NFT", "CLNFT");

        vm.stopBroadcast();

        // Log the deployment
        console.log("CeloLearningNFT deployed at:", address(nft));
    }
}