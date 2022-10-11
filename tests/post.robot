*** Settings ***
Documentation        POST /partners

Resource        ${EXECDIR}/resources/base.robot

*** Test Cases ***
Should create a new partner

    ${payload}        Create Dictionary
    ...                name=Pizza mario
    ...                email=pizzamario@gmail.com.br
    ...                whatsapp=1199999999
    ...                business=Restaurante
    
    Remove Partner By Name               Pizza mario

    ${response}        POST Partner      ${payload}

    Status Should Be    201
    ${result}          Find Partner By Name                  Pizza mario
    Should Be Equal    ${response.json()}[partner_id]        ${result}[_id]