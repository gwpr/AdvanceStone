***Settings***
Resource  ../base.robot

***Keywords***
Logar no sandbox
    [Arguments]     ${client_id}  ${username}  ${password}
    ${body}=  Create Dictionary
    ...     client_id=${client_id}
    ...     username=${username}
    ...     password=${password}
    ...     grant_type=${grant_type}
    
    ${headers}=    Create Dictionary
    ...     Content-Type=application/x-www-form-urlencoded

    Create Session  alias=login
    ...     url=${LOGINSANDBOX}

    ${ret}=  Post Request   alias=login
    ...     uri=/auth/realms/stone_account/protocol/openid-connect/token
    ...     data=${body}
    ...     headers=${headers}

    [Return]    ${ret}

Pegar Token do SANDBOX
    ${result}=  Logar no sandbox  ${client_id}  ${username}  ${password}
    ${login_data}=  Set Variable  ${result.json()}
    ${token}=       Get From Dictionary  ${login_data}  access_token
    [Return]   ${token}

Consultar Contas
    ${token}=   Pegar Token do SANDBOX
   
    ${headers}=   Create Dictionary
    ...  Authorization=Bearer ${token}

    Create Session  alias=consulta
    ...  url=${SANDBOX}

    ${ret}=   Get Request  alias=consulta
    ...  uri=/api/v1/accounts
    ...  headers=${headers}

    Log  ${ret}  console=True
    Log  ${ret.json()}  console=True

    [Return]    ${ret}

Saldo em Conta
    [Arguments]     ${id_account}
    ${token}=   Pegar Token do SANDBOX
        ${headers}=   Create Dictionary
    ...  Authorization=Bearer ${token}

    Create Session  alias=saldo
    ...  url=${SANDBOX}

    ${ret}=   Get Request  alias=saldo
    ...  uri=/api/v1/accounts/${id_account}/balance
    ...  headers=${headers}

    Log  ${ret}  console=True
    Log  ${ret.json()}  console=True

    [Return]    ${ret}

Extrato em Conta
    [Arguments]     ${id_account}
    ${token}=   Pegar Token do SANDBOX
        ${headers}=   Create Dictionary
    ...  Authorization=Bearer ${token}

    Create Session  alias=extrato
    ...  url=${SANDBOX}

    ${ret}=   Get Request  alias=extrato
    ...  uri=/api/v1/accounts/${id_account}/statement
    ...  headers=${headers}

    Log  ${ret}  console=True
    Log  ${ret.json()}  console=True

    [Return]    ${ret}

Simular uma Transferência Interna
    [Arguments]      ${file_json}
    ${body_params}=  Load JSON From File  ${CURDIR}/${file_json}
    ${body}=  Get Value From json  ${body_params}  $..body    
    
    ${token}=   Pegar Token do SANDBOX
        ${headers}=   Create Dictionary
    ...  Authorization=Bearer ${token}

    Create Session  alias=simulador
    ...  url=${SANDBOX}

    ${ret}=   Post Request  alias=simulador
    ...  uri=/api/v1/dry_run/internal_transfers
    ...  headers=${headers}
    ...  json=${body[0]}

    [Return]    ${ret}
