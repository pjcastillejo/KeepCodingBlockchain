// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @title ClimateCoin
 * @dev ERC20 Token con funcionalidad de quema y minteo.
 */
contract ClimateCoin is ERC20 {
    address public owner;

    /**
     * @dev Evento que se emite cuando se mintean nuevos tokens.
     * @param account La dirección que recibe los tokens minteados.
     * @param amount La cantidad de tokens minteados.
     */
    event TokensMinted(address indexed account, uint256 amount);

    /**
     * @dev Evento que se emite cuando se queman tokens.
     * @param account La dirección que quema los tokens.
     * @param amount La cantidad de tokens quemados.
     */
    event TokensBurned(address indexed account, uint256 amount);

    /**
     * @dev Constructor que inicializa el contrato con la dirección del propietario.
     * @param _owner La dirección del propietario del contrato.
     */
    constructor(address _owner) ERC20("ClimateCoin", "CC") {
        owner = _owner;
    }

    /**
     * @dev Función para mintear nuevos tokens. Solo puede ser llamada por el propietario del contrato.
     * @param account La dirección que recibirá los tokens minteados.
     * @param amount La cantidad de tokens a mintear.
     */
    function mint(address account, uint256 amount) public {
        require(msg.sender == owner, "Only the owner can mint tokens");
        _mint(account, amount);
        emit TokensMinted(account, amount);
    }

    /**
     * @dev Función para quemar tokens.
     * @param amount La cantidad de tokens a quemar.
     */
    function burn(uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance to burn tokens");
        _burn(msg.sender, amount);
        emit TokensBurned(msg.sender, amount);
    }

    /**
     * @dev Sobrescribe la función decimals para establecer el número de decimales deseado.
     * @return El número de decimales.
     */
    function decimals() public view virtual override returns (uint8) {
        return 4;
    }
}
