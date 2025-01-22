# Proyecto Final: Desarrollo de DApp ClimateCoin en Solidity

## Introducción a los Créditos de Carbono

Los créditos de carbono son certificados que representan la reducción de emisiones de gases de efecto invernadero. Cada crédito equivale a una tonelada de CO2 no emitida a la atmósfera. Estos créditos surgen de proyectos que reducen, evitan o capturan emisiones. Se utilizan en mercados de carbono, donde empresas o gobiernos los compran para compensar sus propias emisiones de CO2 y cumplir con regulaciones ambientales o metas de sostenibilidad.

Un ejemplo de mercado es [https://www.ecoregistry.io](https://www.ecoregistry.io), que certifica proyectos de reducción de emisiones y facilita el comercio de créditos.

## Flujo de la DApp ClimateCoin

1.  **Certificación del Proyecto:** Un desarrollador, por ejemplo, instala paneles solares en Colombia (ver [https://www.ecoregistry.io/projects/151](https://www.ecoregistry.io/projects/151) como ejemplo). Ecoregistry verifica y certifica la instalación, emitiendo créditos de carbono al desarrollador.
2.  **Creación del NFT:** El desarrollador transfiere esos créditos a una cuenta en ecoregistry.io. Se verifica la recepción y se emite un NFT ERC-721, representando el proyecto en la blockchain. Este NFT incluye detalles como el nombre del proyecto, total de créditos y una URL del proyecto.
3.  **Intercambio por ClimateCoin:** El desarrollador puede intercambiar este NFT por el token fungible ERC-20, ClimateCoin (CC), a razón de 1 CC por crédito de carbono. El NFT pasa a ser propiedad del contrato inteligente. Se retiene una pequeña fee en forma de ClimateCoin.
4.  **Comercio en Mercados Externos:** El desarrollador puede vender sus CC en mercados de terceros.
5.  **Quema de ClimateCoin:** Cualquier poseedor de CC puede “quemar” sus tokens, y el contrato inteligente quemará un NFT correspondiente. Este proceso simboliza el "uso" o "retiro" de créditos de carbono del mercado, permitiendo a empresas compensar su huella de carbono.

Este sistema vincula proyectos de reducción de emisiones con un activo digital (ClimateCoin), facilitando su comercio y trazabilidad en la blockchain.

## Objetivo de la Práctica

Los estudiantes desarrollarán una DApp en Solidity que implemente este flujo de trabajo, comprendiendo el impacto ambiental y la utilidad de los créditos de carbono, así como las posibilidades que ofrece la tecnología blockchain para mejorar la transparencia y eficiencia en el comercio de estos créditos.

## Detalles de la Implementación

1.  **Inicialización y Despliegue del ERC-20 ClimateCoin:**
    *   Crear un contrato inteligente para ClimateCoin siguiendo el estándar ERC-20.
    *   En el constructor del contrato de gestión, se despliega el contrato ERC-20 ClimateCoin.

2.  **Función para Mintear NFT (ERC-721):**
    *   Función `mintNFT`:
        *   Parámetros: `uint256 credits`, `string memory projectName`, `string memory projectURL`, `address developerAddress`.
        *   Solo puede ser llamada por el creador del contrato.
        *   Desplegar un ERC721 para crear el NFT con los datos proporcionados.
        *   Asignar el NFT directamente a `developerAddress`.
        *   Emitir un evento `NFTMinted` con detalles relevantes.

3.  **Función de Intercambio de NFT por ClimateCoins con Sistema de Fees:**
    *   Variables de Fee:
        *   Agregar `uint256 public feePercentage` para almacenar el porcentaje de la fee.
        *   Agregar una función `setFeePercentage(uint256 newFeePercentage)` que permita al propietario del contrato actualizar `feePercentage`.
    *   Función `exchangeNFTForCC`:
        *   Parámetros: `address nftAddress`, `uint256 nftId`.
        *   El NFT se transfiere al contrato.
        *   Transferir la cantidad final de ClimateCoins al `msg.sender`.
        *   Enviar las fees al creador del contrato.
        *   Emitir un evento `NFTExchanged` con detalles de la transacción.

4.  **Función de Quema de ClimateCoins y NFT:**
    *   Función `burnCCAndNFT`:
        *   Parámetros: `uint256 ccAmount`.
        *   Elegir un NFT de la colección del contrato con valor equivalente a `ccAmount`.
        *   Destruir el NFT seleccionado junto a los CC.
        *   Emitir evento `CCBurn` con los detalles del quemado.

## Gestión de Errores y Eventos

*   **Manejo de Excepciones:** Implementar las verificaciones necesarias para asegurar el correcto funcionamiento de la DApp y evitar ser hackeados.
*   **Eventos:** Emitir eventos para facilitar la trazabilidad y el monitoreo en la blockchain.
