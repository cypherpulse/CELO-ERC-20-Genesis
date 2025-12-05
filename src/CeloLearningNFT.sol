// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title CeloLearningNFT
 * @dev A simple ERC-721 NFT contract for learning purposes on EVM-compatible chains like Celo.
 * This contract demonstrates basic NFT minting, ownership control, and secure patterns.
 * Intended for deployment to Celo testnet (e.g., Alfajores or Celo Sepolia).
 *
 * Key features:
 * - Owner-controlled minting to prevent unauthorized NFT creation.
 * - Uses OpenZeppelin libraries for security and standardization.
 * - Emits events for transparency.
 * - Follows checks-effects-interactions pattern.
 *
 * Example usage in Foundry script:
 * ```solidity
 * // In a deployment script
 * CeloLearningNFT nft = new CeloLearningNFT("Celo Learning NFT", "CLNFT");
 * nft.mintNft(address(this), "https://example.com/token/1.json");
 * ```
 *
 * Network configuration (RPC, chainId, explorer) should be handled in your Foundry config (foundry.toml).
 */

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CeloLearningNFT is ERC721, ERC721URIStorage, Ownable {
    /// @dev Counter for token IDs, starts from 0, first token is 1
    uint256 private _tokenIdCounter;

    /// @dev Event emitted when an NFT is minted
    /// @param to The address that receives the NFT
    /// @param tokenId The ID of the minted token
    /// @param uri The URI of the token metadata
    event NftMinted(address indexed to, uint256 indexed tokenId, string uri);

    /// @dev Custom error for invalid recipient address
    error InvalidRecipient();

    /**
     * @dev Constructor to initialize the NFT contract
     * @param name_ The name of the NFT collection
     * @param symbol_ The symbol of the NFT collection
     */
    constructor(string memory name_, string memory symbol_)
        ERC721(name_, symbol_)
        Ownable(msg.sender)
    {
        // No base URI set by default; can be set via _setTokenURI per token
    }

    /**
     * @dev Mints a new NFT to the specified address
     * Only the owner can call this function to maintain control and security.
     * For production, consider role-based access control (e.g., AccessControl) for more flexibility.
     * @param to The address to mint the NFT to. If address(0), mints to msg.sender.
     * @param uri The URI for the token metadata (e.g., IPFS or HTTP link to JSON)
     */
    function mintNft(address to, string memory uri) external onlyOwner {
        // Checks: Validate recipient address
        if (to == address(0)) {
            to = msg.sender; // Default to sender if zero address
        }

        // Effects: Increment token ID
        _tokenIdCounter++;
        uint256 tokenId = _tokenIdCounter;

        // Interactions: Mint and set URI
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);

        // Emit event after state changes (checks-effects-interactions)
        emit NftMinted(to, tokenId, uri);
    }

    /**
     * @dev Returns the total supply of NFTs minted
     * @return The current total supply
     */
    function totalSupply() external view returns (uint256) {
        return _tokenIdCounter;
    }

    /**
     * @dev Overrides the tokenURI function to return the URI for a given token
     * @param tokenId The ID of the token
     * @return The token URI string
     */
    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    /**
     * @dev Burns a token (destroys it). Only the owner of the token can call this.
     * This is a standard ERC721 function, included for completeness.
     * @param tokenId The ID of the token to burn
     */
    function burn(uint256 tokenId) external {
        require(ownerOf(tokenId) == msg.sender, "Only token owner can burn");
        _burn(tokenId);
    }

    /**
     * @dev Required override for ERC721URIStorage
     */
    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}