*** Settings ***
Library        RequestsLibrary


*** Variables ***

*** Test Cases ***

Realizando busca de logradouro e validando
    Create Session    alias=rd_api    url=https://viacep.com.br/ws/03448010/json/
    ${RESPONSE}    GET On Session    alias=rd_api    url=https://viacep.com.br/ws/03448010/json/    expected_status=200
    Log To Console    ${RESPONSE} 
    Log To Console    ${RESPONSE.json()['logradouro']}
    Log To Console    ${RESPONSE.json()['ddd']}

    ${logradouro}    Set Variable     ${RESPONSE.json()['logradouro']}
    ${ddd}    Set Variable    ${RESPONSE.json()['ddd']}

    IF    '${logradouro}'=='Rua Doutor Cristiano Altenfelder Silva'
        Log To Console    Logradouro correto
    ELSE
        Log To Console    Logradouro incorreto
    END

    IF    '${ddd}'=='11'
        Log To Console    DDD correto
    ELSE
        Log To Console    DDD incorreto
    END

    Delete All Sessions
    ${return}    Session Exists    alias=rd_api
    Log To Console    ${return}
    



*** Keywords ***