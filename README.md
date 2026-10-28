# Telmo Dinámico de Moskv · Systems Architect & Hacker

> **AI infrastructure, systems programming, and formal methods — Rust · Python · Lean 4 · Z3**

[![Fleet ledger](https://img.shields.io/badge/Project-Fleet_Ledger-0ea5e9?style=flat-square)](./FLEET_LEDGER.md)

Systems Architect, kernel hacker, and open-source researcher based in **Bilbao, Basque Country**.  
Building tools for agent execution, procedural memory, reverse engineering, and formal methods. The repositories below describe their own implementation boundaries and verification results.

*Operator of the **C5-REAL Sovereign Triad** (`Telmo Dinámico de Moskv` / `Borja Moskv` / `Bakala de Troya`).*

---

## Selected projects

| Project | Purpose |
| :--- | :--- |
| [BABYLON-60](https://github.com/borjamoskv/BABYLON-60) | A user-space execution broker for AI agents, with policy checks and operation-bound authorization. |
| [cortex-persist](https://github.com/borjamoskv/cortex-persist) | Procedural knowledge, agent skills, and operational configuration. |
| [c5-rea](https://github.com/borjamoskv/c5-rea) | Tools for clean-room analysis of supported native binaries and Electron archives. |
| [anvil-lang](https://github.com/borjamoskv/anvil-lang) | A systems language and runtime exploring contract verification with Z3 and Lean 4. |
| [axiom-0](https://github.com/borjamoskv/axiom-0) | A Rust kernel exploring quantitative type theory and normalization by evaluation. |
| [mac-maestro](https://github.com/borjamoskv/mac-maestro) | Semantic-first macOS GUI automation with safety gates and structured traces. |

Cortex Persist maintains procedural knowledge; BABYLON-60 mediates authorized execution; C5-REA provides separate analysis and verification tools. Each project documents its own scope and evidence.

## 🏛️ Public projects

| Repository | Stack | Function & Verification Scope |
| :--- | :--- | :--- |
| [**`BABYLON-60`**](https://github.com/borjamoskv/BABYLON-60) | Rust · Lean 4 · Python · SQLite WAL | User-space execution broker for agents; see its security model and evidence levels |
| [**`c5-rea`**](https://github.com/borjamoskv/c5-rea) | Python Stdlib (`0 deps`) · MCP stdio | Clean-room analysis of supported binaries and Electron archives, with separate contract and behavior verification |
| [**`cortex-persist`**](https://github.com/borjamoskv/cortex-persist) | Python · configuration · agent skills | Procedural knowledge and operational tooling for agent workflows |
| [**`anvil-lang`**](https://github.com/borjamoskv/anvil-lang) | Rust · Z3 SMT · Lean 4 | Systems language and execution runtime exploring SMT and Lean 4 verification |
| [**`axiom-0`**](https://github.com/borjamoskv/axiom-0) | Rust (`zero-deps`) | Quantitative Type Theory (QTT) dependent type kernel with Normalization by Evaluation (NbE) & wait-free `SeqlockCell` |
| [**`c5-socint-extraction-suite`**](https://github.com/borjamoskv/c5-socint-extraction-suite) | Python Stdlib (`0 deps`) | Social intelligence and forensic extraction toolkit |
| [**`teorema-robinson-moskv`**](https://github.com/borjamoskv/teorema-robinson-moskv) | Rust · Lean 4 · Python | Formalization and computational work on the Robinson-Moskv Theorem |
| [**`flstudio-mcp`**](https://github.com/borjamoskv/flstudio-mcp) | Python · FastMCP · MIDI | Native Model Context Protocol server & real-time MIDI/telemetry bridge for FL Studio 2025 |
| [**`mac-maestro`**](https://github.com/borjamoskv/mac-maestro) | Swift · JXA · Python | Semantic-first macOS WindowServer & Safari automation bridge with safety gates and structured traces |
| [**`escohotado-corpus`**](https://github.com/borjamoskv/escohotado-corpus) | Python · MLX · ShareGPT | Structured corpus and analytical tools for the works of Antonio Escohotado |
| [**`para-diana`**](https://github.com/borjamoskv/para-diana) | Typst · Pandoc · Lean 4 | Doctoral research framework and analytical toolkit for comparative literature |
| [**`borjamoskv-site`**](https://github.com/borjamoskv/borjamoskv-site) | Astro · TypeScript · WebAudio | Portfolio, essays, and interactive web projects ([`borjamoskv.com`](https://borjamoskv.com)) |
| [**`naroa.online`**](https://github.com/borjamoskv/naroa.online) | React · TypeScript · Vite | High-craft digital art platform and interactive hyperrealist portfolio |

For project-specific implementation details, tests, and limitations, follow the repository links above. The [fleet ledger](./FLEET_LEDGER.md) records the project inventory.

---

## ⚡ Quickstart & Verification

Inspect [`verify.sh`](./verify.sh) before running it locally. It clones and runs tests for `c5-socint-extraction-suite`, `c5-rea`, and, if Cargo is available, `axiom-0`.

You can also run the checks separately from a working directory:

```bash
git clone https://github.com/borjamoskv/c5-rea.git
(cd c5-rea && python3 -m unittest discover -s tests -v)

git clone https://github.com/borjamoskv/axiom-0.git
(cd axiom-0 && cargo test --all-targets)

git clone https://github.com/borjamoskv/c5-socint-extraction-suite.git
(cd c5-socint-extraction-suite && python3 tests/test_socint.py)
```

---

## 📚 Epistemic Foundations & Lineage

The architecture of **BABYLON-60** and the **C5-REAL** ecosystem converges at the intersection of information thermodynamics, formal methods, and radical humanities:

* **Jorge Luis Borges** (*Combinatorial Memory & Graph Traversal*): *The Library of Babel* as the foundational model for deterministic content-addressed storage and universal state search.
* **Samuel Beckett** (*Subtractive Transduction & State Minimization*): Deliberate impoverishment of noise (*«pour m'appauvrir»*) and reduction to minimal state machines (Myhill-Nerode) in [`para-diana`](https://github.com/borjamoskv/para-diana).
* **Antonio Escohotado** (*Radical Empiricism & Monism of Substance*): Monism of continuous reality, auto-organized order, and empirical falsification over bureaucratic dogma in [`escohotado-corpus`](https://github.com/borjamoskv/escohotado-corpus).
* **Paul Watzlawick** (*Second-Order Change*): Escalation loops (*«the attempted solution is the problem»*) and topological bifurcation (Change 2).
* **Rolf Landauer** (*Thermodynamics of Computation*): The physical floor of information erasure (`ΔQ ≥ k_B T ln 2`).

---

## 🛨️ Technical Stack

```yaml
Languages:      Rust · Lean 4 · Python · TypeScript · Swift
Formal methods: Z3 SMT · Quantitative Type Theory · Normalization by Evaluation
Tooling:        SQLite · MCP · GitHub Actions
```

---

## 🛡️ License & Security Governance

Licenses, verification procedures, and security policies vary by repository. Consult each repository’s license, documentation, and security policy for its applicable terms and disclosure process. For this profile repository, see [`LICENSE.md`](./LICENSE.md) and [`SECURITY.md`](./SECURITY.md).

*Signed: **Telmo Dinámico de Moskv** (`borjamoskv`) · [babylon60.com](https://babylon60.com) · [cortexpersist.com](https://cortexpersist.com) · [borjamoskv.com](https://borjamoskv.com) · Bilbao, Basque Country*
