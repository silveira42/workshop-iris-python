# 💡 Workshop: Python no InterSystems IRIS

## Integração entre E-commerce e ERP

Este projeto simula um ambiente de integração entre um sistema de **e-commerce** e um **ERP**, com foco na utilização de **Python dentro da plataforma InterSystems IRIS**.

A estrutura inclui:

- APIs REST funcionais, parciais e a serem construídas
- Processos internos automatizados
- Casos de uso reais de integração
- Exercícios para implementar lógica em Python

---

## 📚 Como usar este repositório

1. Leia o PDF "Manual de Inicialização Workshop" incluso nesse repositório.
2. Crie um Fork desse repositório no seu Github

3. Clone o repositório forkado:

    ```bash
   git clone https://github.com/seu-usuario/workshop-python-iris.git
   ```

4. Importe o projeto para seu ambiente IRIS

---

## 🛠️ Tecnologias utilizadas

- InterSystems IRIS (com Interoperability e Embedded Python)
- SDK Python do IRIS
- APIs REST
- SQL + Stored Procedures em Python
- Geração de PDF com Python
- Django (Frontend de monitoramento)

---

## 📦 Domínio da aplicação

Conceitos principais:

- Usuário
- Pedido
- Produto
- Preço
- Endereço
- Faturamento

---

## ✅ APIs REST

| Endpoint | Situação | Observações |
|----------|----------|-------------|
| **GET /produto** | ✅ Pronto | API em COS com método de tradução feito com External Language Python |
| **GET /produto/:id** | ⚠️ Parcial | API em COS com método de tradução feito com External Language Python |
| **POST /usuario** | ⚠️ Parcial | Faltando busca de endereço com External Language Python |
| **GET /venda/relatorio** | 🌟 A fazer | Python executar stored procedure SQL |
| **POST /venda/relatorio/download** | 🌟 A fazer | Gera PDF de relatório de vendas em runtime via Python |

---

## 📊 Monitoramento e Visualização

| Recurso | Status | Descrição |
|--------|--------|----------|
| Página Django de monitoramento | ⚠️ Parcial | Tem lista de databases, adicionar lista de processos |

---

## 🧪 Conceitos Python abordados no workshop

- ✅ External Language Python no IRIS
- ✅ Manipulação de JSON, listas, dicionários
- ✅ Criação de métodos e módulos reutilizáveis
- ✅ Uso do Python SDK para acessar globais
- ✅ Geração de PDF dentro do IRIS com bibliotecas Python
- ✅ Uso de Python nos componentes: BS, BP, BO
- ✅ Integração Django com IRIS

---

## 📌 Observações

- Algumas rotas estão 100% prontas, outras **faltando partes estratégicas** para desenvolvermos juntos.
- O objetivo é **aprender Python dentro do IRIS resolvendo problemas reais** de integração.
- A ordem de execução será apresentada durante o workshop.

---
