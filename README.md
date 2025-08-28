# 🚗🔧 Projeto de Banco de Dados – Oficina Mecânica

Repositório com a modelagem e implementação de um **banco de dados relacional** para o cenário de uma oficina mecânica.
O projeto contempla desde a **modelagem conceitual/lógica** até a **implementação em SQL** com dados de exemplo.

---

## 💻 Tecnologias

* MySQL/MariaDB
* SQL (DDL e DML)

---

## 📊 Estrutura do Banco de Dados

O banco foi projetado para gerenciar:

* 👩‍💻 **Clientes** e seus veículos
* 🚙 **Veículos** (um cliente pode ter vários)
* 👨‍🔧 **Mecânicos** organizados em equipes
* 📝 **Ordens de Serviço** (com status e histórico)
* 🛠️ **Serviços** prestados
* 🔩 **Peças** utilizadas no estoque

🔗 **Tabelas associativas:** `ordemservico_servico` e `ordemservico_peca`

---

## 🚀 Como Utilizar

1. Clone o repositório:

   ```bash
   git clone https://github.com/Yasmink-godinho/Projeto-db-oficina.git
   ```
2. Execute o script `oficina_script_creation.sql` → cria o banco `oficina` com tabelas e relacionamentos.
3. Execute `oficina_script_insertion.sql` → popula o banco com dados de exemplo.
4. Explore a base de dados realizando suas próprias consultas.

---

## ✨ Autor

👩‍💻 Desenvolvido por [Yasmin Godinho](https://github.com/Yasmink-godinho)

