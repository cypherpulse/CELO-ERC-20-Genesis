# CeloLearningNFT

[![Solidity](https://img.shields.io/badge/Solidity-^0.8.20-blue.svg)](https://soliditylang.org/)
[![OpenZeppelin](https://img.shields.io/badge/OpenZeppelin-v5.5.0-blue.svg)](https://openzeppelin.com/)
[![Foundry](https://img.shields.io/badge/Foundry-Latest-orange.svg)](https://book.getfoundry.sh/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Celo Network](https://img.shields.io/badge/Network-Celo-blue.svg)](https://celo.org/)

A secure, educational ERC-721 NFT smart contract built for the **Celo Blockchain**. This project demonstrates best practices in Solidity development for the Celo Blockchain Network, with a focus on security, simplicity, and on-chain deployment.

## 🚀 Overview

CeloLearningNFT is a minimal, production-grade ERC-721 contract designed for learning and experimentation on the Celo ecosystem. It showcases:

- **Owner-controlled minting** for secure NFT creation
- **OpenZeppelin libraries** for audited, battle-tested code
- **Checks-effects-interactions pattern** for reentrancy protection
- **Custom errors** and clean code structure
- **Full test coverage** with Foundry

Deployed and verified on **Celo Sepolia** testnet, this contract serves as a foundation for building NFT applications on Celo's fast, low-cost, and mobile-first blockchain.

## ✨ Features

- **ERC-721 Compliant**: Fully compatible with NFT standards
- **Secure Minting**: Only contract owner can mint NFTs
- **URI Storage**: Supports dynamic metadata via token URIs
- **Burnable**: Token owners can burn their NFTs
- **Celo Optimized**: Designed for Celo's EVM compatibility
- **Well-Tested**: Comprehensive test suite with 100% pass rate
- **Gas Efficient**: Minimal external calls and optimized logic

## 🛠 Tech Stack

- **Language**: Solidity ^0.8.20
- **Framework**: Foundry (Forge for testing, Cast for interactions)
- **Libraries**: OpenZeppelin Contracts v5.5.0
- **Network**: Celo Sepolia (Testnet) & Celo Mainnet
- **Explorer**: CeloScan / Blockscout

## 📋 Prerequisites

- [Foundry](https://book.getfoundry.sh/getting-started/installation) installed
- [Git](https://git-scm.com/) for version control
- A Celo-compatible wallet (e.g., MetaMask with Celo extension)
- Basic knowledge of Solidity and Ethereum development

## 🔧 Installation & Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/celo-learning-nft.git
   cd celo-learning-nft
   ```

2. **Install dependencies**:
   ```bash
   forge install
   ```

3. **Set up environment** (create `.env` file):
   ```bash
   # Copy and fill in your values
   cp .env.example .env
   ```

4. **Build the project**:
   ```bash
   forge build
   ```

5. **Run tests**:
   ```bash
   forge test
   ```

## 📖 Usage

### Building
Compile the contracts:
```bash
forge build
```

### Testing
Run the full test suite:
```bash
forge test
```

Run with verbosity:
```bash
forge test -vv
```

### Deployment

Deploy to Celo Sepolia testnet:
```bash
forge script script/DeployCeloLearningNFT.s.sol \
  --rpc-url $CELO_SEPOLIA_RPC_URL \
  --keystore <path-to-keystore> \
  --broadcast \
  --verify
```

### Interacting with the Contract

**Mint an NFT** (owner only):
```bash
cast send --rpc-url $CELO_SEPOLIA_RPC_URL \
  --keystore <path-to-keystore> \
  <contract-address> \
  "mintNft(address,string)" \
  <recipient-address> \
  "https://your-metadata-uri.json"
```

**Check balance**:
```bash
cast call --rpc-url $CELO_SEPOLIA_RPC_URL \
  <contract-address> \
  "balanceOf(address)" \
  <user-address>
```

**Get token URI**:
```bash
cast call --rpc-url $CELO_SEPOLIA_RPC_URL \
  <contract-address> \
  "tokenURI(uint256)" \
  1
```

## 📄 Contract Details

### CeloLearningNFT.sol
- **Inherits**: ERC721, ERC721URIStorage, Ownable
- **Key Functions**:
  - `mintNft(address to, string uri)`: Mint new NFT (owner only)
  - `totalSupply()`: Get total minted NFTs
  - `tokenURI(uint256 tokenId)`: Get metadata URI
  - `burn(uint256 tokenId)`: Destroy NFT (owner only)
- **Security Features**:
  - Access control via `onlyOwner`
  - Input validation
  - Reentrancy-safe patterns

### Architecture
```
CeloLearningNFT
├── ERC721 (Base NFT functionality)
├── ERC721URIStorage (Metadata storage)
└── Ownable (Access control)
```

## 🧪 Testing

The project includes comprehensive tests covering:
- Contract deployment
- Minting functionality
- Access control
- Burning mechanism
- Edge cases (zero address, unauthorized access)

Run tests with coverage:
```bash
forge test --gas-report
```

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. **Fork** the repository
2. **Create** a feature branch: `git checkout -b feature/amazing-feature`
3. **Commit** your changes: `git commit -m 'Add amazing feature'`
4. **Push** to the branch: `git push origin feature/amazing-feature`
5. **Open** a Pull Request

### Guidelines
- Follow [Solidity Style Guide](https://docs.soliditylang.org/en/latest/style-guide.html)
- Write tests for new features
- Update documentation as needed
- Ensure all tests pass before submitting

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support & Community

- **Documentation**: [Celo Developer Docs](https://docs.celo.org/)
- **Forum**: [Celo Forum](https://forum.celo.org/)
- **Discord**: [Celo Discord](https://discord.gg/celo)
- **Issues**: [GitHub Issues](https://github.com/your-username/celo-learning-nft/issues)

## 🙏 Acknowledgments

- [OpenZeppelin](https://openzeppelin.com/) for secure contract libraries
- [Foundry](https://book.getfoundry.sh/) for the development toolkit
- [Celo](https://celo.org/) for the innovative blockchain platform

---

**Built with ❤️ for the Celo ecosystem. Happy coding!**
