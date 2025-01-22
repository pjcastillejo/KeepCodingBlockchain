// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title Project151
 * @dev ERC721 Token que representa créditos de carbono del proyecto 151.
 */
contract Project151 is ERC721, Ownable {
    uint256 public tokenCounter;
    uint256 public constant MAX_SUPPLY = 297565;
    string public constant projectURL = "https://www.ecoregistry.io/projects/151";

    /**
     * @dev Constructor que inicializa el contrato.
     * @param initialOwner La dirección del propietario del contrato.
     */
    constructor(address initialOwner) ERC721("Project151", "P151") Ownable(initialOwner) {
        tokenCounter = 0;
    }

    /**
     * @dev Función para mintear un nuevo NFT.
     * @param developerAddress La dirección del desarrollador que recibirá el NFT.
     */
    function mintNFT(address developerAddress) public onlyOwner {
        require(tokenCounter < MAX_SUPPLY, "Max supply reached");
        uint256 newTokenId = tokenCounter;
        _mint(developerAddress, newTokenId);
        tokenCounter++;
        emit NFTMinted(newTokenId, developerAddress);
    }

    /**
     * @dev Función para quemar un NFT.
     * @param tokenId El ID del NFT a quemar.
     */
    function burn(uint256 tokenId) public onlyOwner {
        _burn(tokenId);
        emit NFTBurned(tokenId);
    }

    /**
     * @dev Evento que se emite cuando se mintea un nuevo NFT.
     * @param tokenId El ID del nuevo NFT.
     * @param developerAddress La dirección del desarrollador que recibe el NFT.
     */
    event NFTMinted(uint256 indexed tokenId, address indexed developerAddress);

    /**
     * @dev Evento que se emite cuando se quema un NFT.
     * @param tokenId El ID del NFT quemado.
     */
    event NFTBurned(uint256 indexed tokenId);
}
