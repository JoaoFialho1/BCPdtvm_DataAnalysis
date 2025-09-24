# Desafio BCP Securities: Análise de Dados de Debêntures 

Este repositório contém a solução para o desafio proposto no processo seletivo da BCP.

O objetivo é desenvolver um script em Python que faz a ETL de dados da ANBIMA sobre Debentures.

As querys supoem a utilização da engine `H2 Database`.

## 📂 Estrutura do Projeto

O projeto está organizado da seguinte forma:

```
├── main.py                                   # Roda o projeto
├── README.md
│
├── src/
│   ├── etl_anbima.py                         # Funções principais
│   └── queries.sql
│
└── Daily Prices/                              # Dados baixados
```

## ▶️ Configuração do Ambiente

Antes de executar, crie um ambiente virtual (venv). Certifique-se de ter o Python (3.12.3) instalado.
1.  **Crie um ambiente virtual, digite no terminal:**
    ```bash
    python -m venv venv
    ```

2.  **Ative o ambiente virtual:**
    *   No Windows:
        ```bash
        .\venv\Scripts\activate
        ```
    *   No macOS/Linux:
        ```bash
        source venv/bin/activate
        ```

3.  **Instale as dependências necessárias:**

    ```bash
    pip install -r requirements.txt
    ```
    Bibliotecas: pandas; requests; openpyxl.

## ▶️ Como Executar

Com o ambiente configurado e as dependências instaladas, basta executar o script principal a partir da raiz do projeto:

```bash
python main.py
```

Ao final da execução `DATA_SET.csv` e os arquivos diários (formato `YYYYmmdd.csv`) serão criados ou atualizados no diretório `/Daily Prices`.

#
## 👨‍💻 Autor
* João Fernando
* LinkedIn: https://www.linkedin.com/in/joaoffialho/