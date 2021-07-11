***Settings***
Resource  keywords/keyword.robot

**Test Cases***

Logar no SandBoxStone com Sucesso
    ${result}=     Logar no sandbox  client_id=${client_id}  username=${username}  password=${password}
    Should Be Equal As Strings  ${result.status_code}   200

Logar no SandBoxStone Inválido
    ${result}=     Logar no sandbox  client_id=1  username=2  password=3
    Should Be Equal As Strings  ${result.status_code}   400

Consultar Todas as Contas Disponíveis
    ${result}=  Consultar Contas
    Should Be Equal As Strings  ${result.status_code}   200

Consultar Saldo com conta Existente
    ${result}=  Saldo em Conta    id_account=${account_id}
    Should Be Equal As Strings  ${result.status_code}   200

Consultar Saldo conta Inexistente
    ${result}=  Saldo em Conta    id_account= 99999999999
    Should Be Equal As Strings  ${result.status_code}   403

Consultar Extrato com conta Existente
    ${result}=  Extrato em Conta    id_account=${account_id}
    Should Be Equal As Strings  ${result.status_code}   200

Consultar Extrato conta Inexistente
    ${result}=  Extrato em Conta    id_account= 99999999999
    Should Be Equal As Strings  ${result.status_code}   403

Simular Transferência Interna com Sucesso
    ${result}=  Simular uma Transferência Interna   file_json=body_internal_transfers.json
    Should Be Equal As Strings  ${result.status_code}   202

Simular Transferência Interna com conta Inválida
    ${result}=  Simular uma Transferência Interna   file_json=body_internal_transfers_invalido.json
    Should Be Equal As Strings  ${result.status_code}   422