# Práctica DApps: Aplicaciones Descentralizadas

## 1. Seleccionar una industria y proponer una solución descentralizada basada en blockchain.

**Instrucciones:**  
Describe la arquitectura sobre la que funcionará tu DApp, características clave de tu propuesta y explica qué problemas estarías solucionando. Además, diseña los tokenomics del proyecto, comprendiendo y aplicando los principios clave de economía de tokens, considerando su utilidad, distribución y relación con el mismo. Responde también:  
- ¿Qué estándar de token usarás?  
- ¿Por qué?

---

## Proyecto: **PharmaChain** - Solución Blockchain para la Industria Farmacéutica  

### **Objetivo Principal**  
El proyecto *PharmaChain* tiene como objetivo crear una solución descentralizada basada en tecnología blockchain para mejorar la transparencia, la seguridad y la eficiencia en la gestión de datos y procesos en la industria farmacéutica. PharmaChain se centrará en:  
1. Asegurar la trazabilidad de los medicamentos.  
2. Gestionar ensayos clínicos de manera transparente.  
3. Facilitar un sistema de pago eficiente entre los actores del ecosistema (laboratorios, hospitales, proveedores de medicamentos y pacientes).  

---

### **Arquitectura del Proyecto**

La arquitectura de PharmaChain está basada en una aplicación descentralizada (*DApp*) construida sobre la blockchain de Ethereum (utilizando el estándar ERC-20 para tokens).  

#### **Componentes Principales de la Arquitectura:**

1. **Capa de Blockchain (Ethereum):**
   - Ethereum se utiliza como la capa base de la blockchain para garantizar la transparencia, la inmutabilidad y la descentralización de los datos.  
   - Uso de *smart contracts* para gestionar transacciones y reglas de negocio, como pagos, distribución de datos y gobernanza.  

2. **Capa de Datos:**
   - **IPFS (InterPlanetary File System):** Almacenamiento descentralizado de datos grandes como informes de ensayos clínicos, investigaciones científicas y registros de distribución.  
   - **Oráculos:** para la integración de datos del mundo real en la blockchain, como precios de medicamentos, resultados de ensayos clínicos o ubicaciones de envíos.

3. **Capa de Interfaz de Usuario (dApp):**
   - **Aplicación Web:** Interfaz amigable para que actores como laboratorios, médicos, pacientes y proveedores interactúen fácilmente con la plataforma. Funciones:  
     - Registro de medicamentos.  
     - Gestión de transacciones de pago.  
     - Acceso a información sobre ensayos clínicos.  
     - Visualización de la trazabilidad de productos farmacéuticos.

4. **Capa de Pagos:**
   - Implementación de un sistema de pagos basado en tokens para transacciones rápidas y seguras. Los tokens también se utilizarán en la gobernanza del proyecto.  

---

### **Características Clave del Proyecto**

1. **Trazabilidad de Medicamentos:**  
   - **Problema:** La falsificación de medicamentos pone en riesgo la salud de los pacientes.  
   - **Solución:** PharmaChain registrará cada paso del ciclo de vida de un medicamento en la blockchain, verificando su autenticidad mediante códigos QR y escaneos.  

2. **Gestión Transparente de Ensayos Clínicos:**  
   - **Problema:** Manipulación de datos de ensayos clínicos.  
   - **Solución:** Registro inmutable de datos y resultados accesibles para participantes, reguladores y público general.  

3. **Intercambio Seguro de Datos de Salud:**  
   - **Problema:** Falta de interoperabilidad y centralización de datos de salud.  
   - **Solución:** Los pacientes tendrán control sobre su información médica, compartiéndola de forma segura con hospitales y médicos.  

4. **Sistema de Pagos Eficiente:**  
   - **Problema:** Lentitud y altos costos en pagos entre proveedores y hospitales.  
   - **Solución:** Uso de tokens para simplificar pagos, reducir costos y automatizar procesos con *smart contracts*.  

---

### **Tokenomics del Proyecto**

#### **Tipo de Token:**  
- ERC-20 en la blockchain de Ethereum.  

#### **Propósito del Token:**  
1. **Medio de Pago:** Para transacciones entre hospitales, farmacias, distribuidores y pacientes.  
2. **Incentivos y Recompensas:** Por compartir datos de salud o completar ensayos clínicos.  
3. **Gobernanza:** Participación en decisiones clave del proyecto.  

#### **Distribución del Token:**  
1. **Usuarios del Ecosistema (40%):** Recompensas para hospitales, pacientes y laboratorios.  
2. **Desarrolladores y Ecosistema Técnico (20%):** Tokens para desarrollo e integración de servicios.  
3. **Inversores Iniciales (15%):** Financiamiento inicial con periodo de "vesting".  
4. **Equipo Fundador y Empleados (15%):** Liberación gradual para motivación a largo plazo.  
5. **Fondo de Reserva y Alianzas (10%):** Tokens para alianzas estratégicas.  

#### **Mecanismo de Gobernanza:**  
- Los poseedores de tokens podrán votar sobre servicios, modificaciones y actualizaciones del protocolo.  
- Uso de *staking* para recibir recompensas y mayor influencia en la gobernanza.  

#### **Justificación del Estándar ERC-20:**  
1. **Ampliamente Aceptado:** Compatible con múltiples plataformas y carteras.  
2. **Simplicidad y Flexibilidad:** Fácil implementación de reglas de negocio.  
3. **Liquidez y Adopción:** Mayor probabilidad de liquidez y adopción en el mercado.  

---

## 2. Crear una billetera con Metamask y realizar una transacción cualquiera (testnet).  

**Hash de Transacción:**  
`0x222ae8c3fb7676da421659ddcf0adc7dba4db68dd661d2e5d497434ac9dcb605`  

**Detalles de la Transacción:**  
- **Estado:** Success  
- **Block:** 73176697  
- **Timestamp:** Dec-20-2024 11:24:36 AM UTC  
- **De:** `0xf244248E24BF11aDDfCe6360863954434DBd735a`  
- **Para:** `0xf244248E24BF11aDDfCe6360863954434DBd735a`  
- **Valor:** 0.01 ETH  
- **Tarifa:** 0.000249557896287 ETH  
- **Gas Price:** 11.883709347 Gwei  

[This is a Sepolia Testnet transaction only.]  
