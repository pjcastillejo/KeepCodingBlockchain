# Descrpción de los contratos ClimateCoin, Project151, Exchange y Burn

Los contratos han sido editados y compilados con https://remix.ethereum.org/
Este documento describe la interacción entre los cuatro contratos inteligentes: ClimateCoin, Project151, Exchange y Burn.

## 1. ClimateCoin

*   Es un token ERC-20 que representa los ClimateCoins (CC).
*   Permite mintear y quemar tokens.
*   El propietario del contrato puede mintear nuevos tokens.
*   Cualquier poseedor de ClimateCoins puede quemar sus tokens.

## 2. Project151

*   Es un token ERC-721 que representa los créditos de carbono del proyecto 151.
*   Permite mintear y quemar NFTs.
*   El propietario del contrato puede mintear nuevos NFTs.
*   El propietario del contrato puede quemar los NFTs que posee.

## 3. Exchange

Este contrato permite a los usuarios intercambiar sus NFTs de Project151 por ClimateCoins. El flujo de interacción es el siguiente:

1.  Un usuario que posee un NFT de Project151 llama a la función `exchangeNFTForCC` en el contrato Exchange.
2.  El contrato Exchange verifica:
    *   Que el usuario sea el propietario del NFT.
    *   Que el NFT no haya sido intercambiado previamente.
3.  El NFT se transfiere al contrato Exchange y se marca como intercambiado.
4.  El contrato Exchange calcula la fee y mintea los ClimateCoins correspondientes:
    *   Para el usuario.
    *   La fee para el propietario del contrato.
5.  Se emite el evento `NFTExchanged` con los detalles de la transacción.

## 4. Burn

Este contrato permite a los usuarios quemar sus ClimateCoins y, a cambio, el contrato quema los NFTs correspondientes. El flujo de interacción es el siguiente:

1.  Un usuario que posee ClimateCoins llama a la función `burnCCAndNFT` en el contrato Burn.
2.  El contrato Burn verifica que el usuario tenga suficientes ClimateCoins para quemar.
3.  El contrato Burn quema los ClimateCoins del usuario.
4.  El contrato Burn selecciona un NFT de su colección y lo quema.
5.  Se emite el evento `CCBurn` con los detalles de la quema.

## Interacción entre los contratos

### Minteo de NFTs y ClimateCoins

*   El propietario del contrato Project151 puede mintear nuevos NFTs y asignarlos a los desarrolladores.
*   El propietario del contrato ClimateCoin puede mintear nuevos ClimateCoins.

### Intercambio de NFTs por ClimateCoins

*   Los usuarios pueden intercambiar sus NFTs de Project151 por ClimateCoins a través del contrato Exchange.
*   El contrato Exchange transfiere los NFTs al contrato y mintea ClimateCoins para el usuario.

### Quema de ClimateCoins y NFTs

*   Los usuarios pueden quemar sus ClimateCoins a través del contrato Burn.
*   El contrato Burn quema los ClimateCoins del usuario y selecciona un NFT de su colección para quemar.

