# AdvanceStone
Desafio - Nível Avançado

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
Rode o comando:
```
python3 -m robot -d ./logs -i @sunflower -v ENV_OS:Android  -L debug tests
```
**Observação:** Possível ver todo o histórico de execução na pasta logs (arquivo html)
