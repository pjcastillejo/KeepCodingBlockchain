// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./ClimateCoin.sol";
import "./Project151.sol";

/**
 * @title Exchange
 * @dev Contrato para el intercambio de NFTs por ClimateCoins.
 */
contract Exchange {
    ClimateCoin public climateCoin;
    Project151 public project151;
    address public owner;
    uint256 public feePercentage;
    mapping(uint256 => bool) public exchangedNFTs;

    /**
     * @dev Constructor que inicializa el contrato con las direcciones de ClimateCoin y Project151.
     * @param _climateCoin La dirección del contrato ClimateCoin.
     * @param _project151 La dirección del contrato Project151.
     */
    constructor(address _climateCoin, address _project151) {
        climateCoin = ClimateCoin(_climateCoin);
        project151 = Project151(_project151);
        owner = msg.sender;
        feePercentage = 1; // Fee inicial del 1%
    }

    /**
     * @dev Función para establecer el porcentaje de la fee.
     * @param newFeePercentage El nuevo porcentaje de la fee.
     */
    function setFeePercentage(uint256 newFeePercentage) public {
        require(msg.sender == owner, "Only the owner can set the fee percentage");
        feePercentage = newFeePercentage;
    }

    /**
     * @dev Función para intercambiar un NFT por ClimateCoins.
     * @param nftId El ID del NFT a intercambiar.
     */
    function exchangeNFTForCC(uint256 nftId) public {
        require(project151.ownerOf(nftId) == msg.sender, "You do not own this NFT");
        require(!exchangedNFTs[nftId], "This NFT has already been exchanged");
        project151.transferFrom(msg.sender, address(this), nftId);
        exchangedNFTs[nftId] = true;
        uint256 fee = (1 * feePercentage) / 100;
        uint256 finalAmount = 1 - fee;
        climateCoin.mint(msg.sender, finalAmount);
        climateCoin.mint(owner, fee);
        emit NFTExchanged(msg.sender, nftId, finalAmount, fee);
    }

    /**
     * @dev Evento que se emite cuando se intercambia un NFT por ClimateCoins.
     * @param user La dirección del usuario que intercambia el NFT.
     * @param nftId El ID del NFT intercambiado.
     * @param amount La cantidad de ClimateCoins recibidos.
     * @param fee La cantidad de ClimateCoins cobrados como fee.
     */
    event NFTExchanged(address indexed user, uint256 indexed nftId, uint256 amount, uint256 fee);
}
