// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {CeloLearningNFT} from "../src/CeloLearningNFT.sol";

contract CeloLearningNFTTest is Test {
    CeloLearningNFT nft;
    address owner = address(1);
    address user = address(2);

    function setUp() public {
        vm.prank(owner);
        nft = new CeloLearningNFT("Celo Learning NFT", "CLNFT");
    }

    function testDeployment() public view {
        assertEq(nft.name(), "Celo Learning NFT");
        assertEq(nft.symbol(), "CLNFT");
        assertEq(nft.owner(), owner);
    }

    function testMintNft() public {
        vm.prank(owner);
        nft.mintNft(user, "https://example.com/token/1.json");

        assertEq(nft.balanceOf(user), 1);
        assertEq(nft.ownerOf(1), user);
        assertEq(nft.tokenURI(1), "https://example.com/token/1.json");
        assertEq(nft.totalSupply(), 1);
    }

    function testMintNftToZeroAddressDefaultsToSender() public {
        vm.prank(owner);
        nft.mintNft(address(0), "https://example.com/token/1.json");

        assertEq(nft.ownerOf(1), owner);
    }

    function testOnlyOwnerCanMint() public {
        vm.prank(user);
        vm.expectRevert();
        nft.mintNft(user, "https://example.com/token/1.json");
    }

    function testBurn() public {
        vm.prank(owner);
        nft.mintNft(owner, "https://example.com/token/1.json");

        vm.prank(owner);
        nft.burn(1);

        vm.expectRevert();
        nft.ownerOf(1);
    }

    function testBurnOnlyByOwner() public {
        vm.prank(owner);
        nft.mintNft(owner, "https://example.com/token/1.json");

        vm.prank(user);
        vm.expectRevert("Only token owner can burn");
        nft.burn(1);
    }
}