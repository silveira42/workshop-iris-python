# 💡 Workshop: Python no InterSystems IRIS

## Integração entre E-commerce e ERP

Este projeto simula um ambiente de integração entre um sistema de **e-commerce** e um **ERP**, com foco na utilização de **Python dentro da plataforma InterSystems IRIS**.

A estrutura inclui:

- APIs REST funcionais, parciais e a serem construídas
- Processos internos automatizados
- Casos de uso reais de integração
- Exercícios para implementar lógica em Python

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
- Estoque
- Entrega
- Relatório
- Cupom
- Nota Fiscal
- Reembolso
- Faturamento
- Logs
- Dashboard

---

## ✅ APIs REST

| Endpoint | Situação | Observações |
|----------|----------|-------------|
| **GET /produtos** | ✅ Pronto | API em COS com método de ordenação feito com External Language Python |
| **GET /produtos/:id** | ✅ Pronto | API simples em COS |
| **POST /cupons/validar** | ✅ Pronto | *API em python sendo executada pelo IRIS* |
| **POST /relatorios/download** | 🌟 A fazer | Recebe dados de venda e devolve PDF com relatório gerado via Python |
| **POST /usuarios** | ⚠️ Parcial | Faltando validações com External Language Python |
| **GET /faturamento** | 🌟 A fazer | Python executar stored procedure SQL |

---

## 📊 Monitoramento e Visualização

| Recurso | Status | Descrição |
|--------|--------|----------|
| Página Django de monitoramento | ⚠️ Parcial | Tem lista de databases, adicionar lista de processos |

---

## 🧪 Conceitos Python abordados no workshop

- ✅ Criação de verbos em APIs usando Python
- ✅ External Language Python no IRIS
- ✅ Manipulação de JSON, listas, dicionários
- ✅ Criação de métodos e módulos reutilizáveis
- ✅ Uso do Python SDK para acessar globais
- ✅ Uso de `iris.sql` para queries dinâmicas
- ✅ Stored Procedures SQL escritas em Python
- ✅ Geração de PDF dentro do IRIS com bibliotecas Python
- ✅ Uso de Python nos componentes: BS, BP, BO
- ✅ Integração Django com IRIS via Native API

---

## 📚 Como usar este repositório

1. Crie um fork deste repositório na sua conta GitHub

2. Clone o repositório forkado:

    ```bash
   git clone https://github.com/seu-usuario/workshop-python-iris.git
   ```

3. Importe o projeto para seu ambiente IRIS

4. Navegue pelos diretórios:

   - `/rest` → APIs
   - `/interop` → Produção com BS/BP/BO
   - `/scripts/python/` → Scripts auxiliares
   - `/monitoramento` → Projeto Django

5. Consulte os exercícios propostos em cada pasta

---

## 📌 Observações

- Algumas rotas estão 100% prontas, outras **faltando partes estratégicas** para desenvolvermos juntos.
- O objetivo é **aprender Python dentro do IRIS resolvendo problemas reais** de integração.
- A ordem de execução será apresentada durante o workshop.

---
