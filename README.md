# AdvanceStone
Desafio - Nível Avançado

## Desafio 1
Conforme Conforme solicitado testes em BDD: BDD Modelo de Teste.pdf
O mesmo encontra-se na Raiz do Projeto

Também foi inserido uma Planilha com o plano de Teste para regressivo: Planilha Modelo de Testes.pdf


## Desafio 2 e 3 - Automação Mobile / Automação API

## Pré Requisitos
**Python3**

**Pip3** (Gerênciador de pacotes)

**Máquina Configurada com APPIUM**

**Máquina Configurada com as variáveis de ambiente do Android**

**Emulador Android** OU **Device Físico conectado ao PC/MAC**

## Clone o Projeto
https://github.com/gwpr/AdvanceStone.git

## 1 - Configurando o Projeto
Na raiz do projeto rode o comando:
``` bash
pip3 install -r requirements.txt
```
Com isso todas as dependências do projeto serão instaladas.

## 2 - Executando os testes MOBILE
Startar o APPIUM

Rode o comando:
```
python3 -m robot -d ./logs_ui -i @sunflower -v ENV_OS:Android  -L debug tests
```
**Observação:** Possível ver todo o histórico de execução na pasta logs_ui (arquivo html)


## Executar testes de API
Startar o APPIUM

Rode o comando
```
python3 -m robot -d ./log_api -i @api_stone -L debug tests
```
**Observação:** Possível ver todo o histórico de execução na pasta log_api (arquivo html)