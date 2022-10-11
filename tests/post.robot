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

    ${headers}        Create Dictionary
    ...                Content-Type=application/json
    ...                auth_user=qa
    ...                auth_password=ninja

    ${filter}         Create Dictionary
    ...                name=Pizza mario

    Delete One        ${MONGO_URI}    ${filter}

    ${response}        POST        ${BASE_URL}        
    ...                json=${payload}        
    ...                headers=${headers}

    Status Should Be    201

    Log To Console        ${response.json()}[partner_id]

    ${results}     Find        ${MONGO_URI}        ${filter}
    
    Should Be Equal    ${response.json()}[partner_id]        ${results}[0][_id]