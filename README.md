# Prolog Sentence Parser 🧠🌳

![Status](https://img.shields.io/badge/Status-Maintained-success) 
![Version](https://img.shields.io/badge/Version-1.0.0-blue)
![Prolog](https://img.shields.io/badge/Language-Prolog-F2C94C?logo=prolog&logoColor=black)

## 📌 Overview

**Prolog Sentence Parser** is an advanced Definite Clause Grammar (DCG) engine built in Prolog for natural language processing. It accepts raw English syntax, tokenizes the input, generates a structural Abstract Syntax Tree (AST), visibly renders it using an ASCII visualizer, simplifies compound lexical trees, and finally performs semantic context translation into Spanish.

### The Problem It Solves
Traditional parser frameworks are overly bulky and rely heavily on deep-learning. This engine proves that deterministic symbolic regression using the pure logic-programming constraints of Prolog is incredibly lightweight, highly accurate for established syntactical bounds, and capable of sophisticated multi-stage pipeline processing (Parsing → Tree Render → Simplification → Translation).

---

## 🛠️ Tech Stack

*   **SWI-Prolog** - Core logic compilation and pattern matching.
*   **DCG (Definite Clause Grammars)** - Token-based AST routing rules.

---

## 🚀 Key Features

*   **Robust DCG Parsing**: Detects Noun Phrases, Verb Phrases, Adjective Phrases, Adverb Phrases, Prepositional Phrases, and Subordinate Clauses.
*   **Multi-Faceted Simplification**: Flattens nested clauses, resolves coordinated sentences, and reduces structural redundancies cleanly.
*   **ASCII AST Tree Rendering**: Automatically builds elegant console-based visual tree structures representing deep lexical groupings.
*   **English to Spanish Pipeline**: Synchronously maps english logical trees cleanly to localized spanish syntax structures without information loss.

---

## 📂 Project Architecture

```text
📦 SentenceParser
 ┣ 📂 docs
 ┃ ┗ 📜 Informe.pdf               # Original academic paper/documentation
 ┣ 📜 sentenceParser.pl           # Main application entrypoint & DCG grammar definitions
 ┣ 📜 translator.pl               # Bilingual translation mappings & iteration logic
 ┣ 📜 treeDrawer.pl               # External script for rendering the ASCII syntax tree
 ┣ 📜 .gitignore                  # SWI-Prolog focused environment exclusion list
 ┗ 📜 README.md                   # This project index documentation
```

---

## ⚙️ Setup Guide

### Prerequisites
You need **SWI-Prolog** installed on your system. 
You can download it from [swi-prolog.org](https://www.swi-prolog.org/download/stable).

### Installation & Usage

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/Prolog-Sentence-Parser.git
   cd Prolog-Sentence-Parser
   ```

2. **Launch SWI-Prolog environment & load the main file:**
   ```bash
   swipl -s sentenceParser.pl
   ```

3. **Run Unit Tests:**
   Within the SWI-Prolog interface, you can call the test scripts directly:
   ```prolog
   % Run standard phrase test cases (1 through 14)
   ?- test. 

   % Run advanced 'Snow White' narrative test cases (30 sequences)
   ?- snow_white.
   ```

4. **Input Custom Phrases:**
   ```prolog
   ?- processUserPhrase.
   ```
   *Follow the standard prompt to write valid syntax, mapping natively against the predefined lexicons.*

---

## 👥 Authors

This repository has been proudly architected and maintained by:
*   **Andrea Pascual Aguilera**
*   **Sergio Alonso Zarcero**

---

## 🗺️ Future Roadmap

- [ ] **Dynamic Lexicon Expansion**: Intercept unknown words and query them against WordNet/external dictionary APIs.
- [ ] **Bi-Directional AST Translation**: Extend `translator.pl` to allow reverse mapping natively parsing Spanish back into English grammatical structures.
- [ ] **GUI Visualizer**: Implement a lightweight Flask/Prolog bridge to export the logical ASTs to a web interface (D3.js).
