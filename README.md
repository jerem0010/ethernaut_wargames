# 🧠 Ethernaut Wargames Solutions

This repository contains my solutions to the **Ethernaut wargame**, a Web3/Solidity security challenge platform focused on smart contract vulnerabilities.

👉 Each level is solved using:

* Custom exploit contracts (`src/`)
* Foundry scripts for execution (`script/`)
* A security-focused approach (understanding the vulnerability, exploiting it, and thinking about mitigations)

---

## 🎯 Objective

The goal of this repository is to:

* Develop a deep understanding of common smart contract vulnerabilities
* Practice offensive security (thinking like an attacker)
* Build a strong foundation for **smart contract auditing**

---

## 🛠️ Tech Stack

* **Foundry** (Forge, Cast, Anvil)
* **Solidity**
* **EVM internals**
* Testing & scripting via Forge

---

## 📂 Repository Structure

```bash
.
├── src/        # Exploit contracts (Attack contracts)
├── script/     # Scripts used to execute attacks
├── test/       # (Optional) tests
├── lib/        # Dependencies
├── foundry.toml
```

---

## 🚀 How to Run

### Build

```bash
forge build
```

### Test

```bash
forge test
```

### Run a Script

```bash
forge script script/SolveFallback.s.sol --rpc-url <RPC_URL> --private-key <PRIVATE_KEY> --broadcast
```

---

## 🔐 Covered Vulnerabilities

This repository includes exploits for multiple classes of vulnerabilities:

* Reentrancy
* Access control issues
* Storage manipulation
* Delegatecall abuse
* Integer issues / logic flaws
* Denial of service
* Oracle / randomness weaknesses
* Proxy & upgrade patterns

---

## 📘 Example Levels

Each level includes:

* Attack contract
* Exploit script
* Understanding of the vulnerability

Examples:

* `Fallback` → ownership takeover via fallback misuse
* `CoinFlip` → predictable randomness
* `Delegation` → delegatecall exploit
* `Reentrance` → reentrancy attack
* `Gatekeeper` series → low-level EVM constraints
* `Dex / DexTwo` → flawed AMM logic
* `DoubleEntryPoint` → detection bypass

---

## 🧪 Methodology

For each challenge, I follow this approach:

1. **Understand the contract logic**
2. Identify **critical state variables & invariants**
3. Look for **attack surfaces**
4. Build a **minimal exploit**
5. Execute via Foundry script

---

## 🧠 What I Learned

* How subtle smart contract bugs can be exploited
* Importance of invariants and state transitions
* How attackers chain multiple interactions
* Writing exploits is the best way to understand security

---

## ⚠️ Disclaimer

This repository is for **educational purposes only**.
All exploits are performed in controlled environments.
