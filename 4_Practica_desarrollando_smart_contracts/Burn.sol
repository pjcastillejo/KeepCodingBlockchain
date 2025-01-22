// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./ClimateCoin.sol";
import "./Project151.sol";

/**
 * @title Burn
 * @dev Contrato para la quema de ClimateCoins y NFTs.
 */
contract Burn {
    ClimateCoin public climateCoin;
    Project151 public project151;
    address public owner;

    /**
     * @dev Constructor que inicializa el contrato con las direcciones de ClimateCoin y Project151.
     * @param _climateCoin La dirección del contrato ClimateCoin.
     * @param _project151 La dirección del contrato Project151.
     */
    constructor(address _climateCoin, address _project151) {
        climateCoin = ClimateCoin(_climateCoin);
        project151 = Project151(_project151);
        owner = msg.sender;
    }

    /**
     * @dev Función para quemar ClimateCoins y NFTs.
     * @param ccAmount La cantidad de ClimateCoins a quemar.
     */
    function burnCCAndNFT(uint256 ccAmount) public {
        require(climateCoin.balanceOf(msg.sender) >= ccAmount, "Insufficient ClimateCoins to burn");
        climateCoin.burn(ccAmount);
        uint256 nftId = selectNFT();
        project151.burn(nftId);
        emit CCBurn(msg.sender, ccAmount, nftId);
    }

    /**
     * @dev Función interna para seleccionar un NFT.
     * @return El ID del NFT seleccionado.
     */
    function selectNFT() internal pure returns (uint256) {
        // Lógica para seleccionar un NFT
        // Esto es solo un ejemplo y debe ser implementado según la lógica del proyecto
        return 0;
    }

    /**
     * @dev Evento que se emite cuando se queman ClimateCoins y NFTs.
     * @param user La dirección del usuario que quema los ClimateCoins.
     * @param ccAmount La cantidad de ClimateCoins quemados.
     * @param nftId El ID del NFT quemado.
     */
    event CCBurn(address indexed user, uint256 ccAmount, uint256 indexed nftId);
}
