*** Settings ***

Library    AppiumLibrary    timeout=10    run_on_failure=No Operation


Documentation    

*** Variables ***

${REMOTE_URL}         http://127.0.0.1:4723/wd/hub
${PLATFORM_NAME}      Android
${PLATFORM_VERSION}   8.1.0
${DEVICE_NAME}        emulator-5554
${Dir_App}            C:\\ProjetoAutomacaoMenewApp\\Apps
${APP}                ${Dir_App}\\app-mobile-test.apk
${PACKAGE_NAME}       com.menewapp
${Activity_NAME}      com.menewapp.MainActivity

${url}                                https://web.vpn.mvarandas.com.br
${porta}                              443/3731-5TARQ
${modo_mesa}                         //*[contains(@text,'Modo: Mesa')]
${input_cnpj_cpf}                   //*[@resource-id="ConfigInputTextCnpjOrCpf"]
${button_sinc_dados}               //*[@resource-id="ConfigButtonSyncCnpjOrCpf"]
${button_select_adquirente}       //*[@resource-id="SelectAdquirenteButton"]
${checkbox_fiscal}               //*[@resource-id="ConfigCheckboxFiscal"]
${text_url}                     //*[@resource-id="ConfigTextInfoUrl"]
${text_porta}                  //*[@resource-id="ConfigTextInfoPorta"]
${button_select_terminais}    //*[@resource-id="SelectTerminalButton"]
${button_save_or_update}     //*[@resource-id="ConfigButtonUpdateOrSave"]
${text_app_salvar}          //*[contains(@text,'Atualizado com sucesso')]   

*** Keywords ***

Open menewapp
  Open Application   ${REMOTE_URL}
              ...    platformName=${PLATFORM_NAME}
              ...    platformVersion=${PLATFORM_VERSION}
              ...    deviceName=${DEVICE_NAME}
              ...    automationName=UiAutomator2
              ...    newCommandTimeout=2500
              ...    app=${APP}
              ...    appPackage=${PACKAGE_NAME}
              ...    appActivity=${Activity_NAME}

Esperar carregar a tela de splash
    Sleep    5s

Preencher CNPJ/CPF
    Input Text    ${input_cnpj_cpf}    29718533000195
    Sleep    2s

Sincronizar CNPJ/CPF
    Click Element    ${button_sinc_dados}
    Wait Until Page Does Not Contain Element    ${button_select_adquirente}

Verificar a inexistência do modal de Adquirente
    Page Should Not Contain Element     ${button_select_adquirente}
    Wait Until Element Is Visible    ${checkbox_fiscal}

Verificar a presença do checkbox fiscal
    Element Should Be Visible    ${checkbox_fiscal}

Validar texto da URL e Porta
    Element Text Should Be    ${text_url}    https://web.vpn.mvarandas.com.br    ${url}
    Element Text Should Be    ${text_porta}    443/3731-5TARQ                    ${porta}

Verificar a presença do modal de Terminais
    Page Should Contain Element     ${button_select_terminais}   

Validar texto do Modo do terminal
    Page Should Contain Element    ${modo_mesa}    

Clicar em Salvar
    Click Element    ${button_save_or_update}
    Wait Until Page Contains Element    //*[contains(@text,'Login')]   

Validar texto atualizado com sucesso
    Page Should Contain Element    ${text_app_salvar} 

Validar se o app foi para a tela de login
    Page Should Contain Element    //*[contains(@text,'Login')] 
      

*** Test Cases ***
CT MENE-W-160: CONFIGURAR APP RECÉM INSTALADO NO SMARTPHONE.
    Open menewapp
    Esperar carregar a tela de splash
    Preencher CNPJ/CPF
    Sincronizar CNPJ/CPF
    Verificar a inexistência do modal de Adquirente
    Verificar a presença do checkbox fiscal
    Validar texto da URL e Porta
    Validar texto do Modo do terminal
    Clicar em Salvar
    Validar se o app foi para a tela de login
   
