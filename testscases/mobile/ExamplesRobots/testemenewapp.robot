*** Settings ***

Library    AppiumLibrary   

*** Variables ***

${REMOTE_URL}         http://127.0.0.1:4723/wd/hub
${PLATFORM_NAME}      Android
${PLATFORM_VERSION}   8.1.0
${DEVICE_NAME}        emulator-5554
${APP}                ${CURDIR}\\apks\\app-mobile-stone.apk
${PACKAGE_NAME}       com.menewapp
${Activity_NAME}      com.menewapp.MainActivity
${appiumreset}        true
${input_cnpj_cpf}     //*[@resource-id="ConfigInputTextCnpjOrCpf"]
${button_sinc_dados}  //*[@resource-id="ConfigButtonSyncCnpjOrCpf"]

${button_select_adquirente}    //*[@resource-id="SelectAdquirenteButton"]

${scroll_select_adquirentes}    //*[@resource-id="SelectAdquirenteScrollView"]    #vai ser usado para clicar nele e arrastar e mostrar as outras opções

${select_options_adquirentes}     //*[@resource-id="SelectAdquirenteButtonRender0"]     # É uma lista de arrays então começa do 0 como o primeiro da lista e assim sucessivamente.

${input_stone_code}    //*[@resource-id="ConfigInputTextStoneCode"]

${button_sinc_stone_code}  //*[@resource-id="ConfigButtonSyncStoneCode"]

${checkbox_fiscal}    //*[@resource-id="ConfigCheckboxFiscal"]

${checkbox_venda_direta}    //*[@resource-id="ConfigCheckboxVendaDireta"]

${input_numero_terminal}     //*[@resource-id="ConfigInputTextNumeroTerminal"]

${text_url}     //*[@resource-id="ConfigTextInfoUrl"]

${text_porta}     //*[@resource-id="ConfigTextInfoPorta"]

${button_select_terminais}    //*[@resource-id="SelectTerminalButton"]

${scroll_select_terminais}    //*[@resource-id="SelectTerminalScrollView"]    #vai ser usado para clicar nele e arrastar e mostrar as outras opções

${select_options_terminais}     //*[@resource-id="SelectTerminalButtonRender0"]     # É uma lista de arrays então começa do 0 como o primeiro da lista e assim sucessivamente.
 
${button_save_or_update}     //*[@resource-id="ConfigButtonUpdateOrSave"]

${button_voltar_tela_config}     //*[@resource-id="ConfigButtonBack"]

${button_voltar_icon_top_tela_config}     //*[@resource-id="IconButtonHeader"]

${button_menu_login}     //*[@resource-id="LoginButtonMenuDrawer"]

${button_sair_login}     //*[@resource-id="LoginButtonExit"]

${button_select_operadores_login}    //*[@resource-id="SelectLoginButton"] 

${scroll_select_operadores_login}    //*[@resource-id="SelectLoginScrollView"]    #vai ser usado para clicar nele e arrastar e mostrar as outras opções

${select_options_operadores_login}    //*[@resource-id="SelectLoginButtonRender1"]    # É uma lista de arrays então começa do 0 como o primeiro da lista e assim sucessivamente.

${button_entrar_login}    //*[@resource-id="LoginButtonEntrar"]

${text_version_app}    //*[@resource-id="TextVersionApp"]

${button_close_menu}    //*[@resource-id="ButtonCloseMenu"]

${button_configuracao_menu}    //*[@resource-id="ButtonMenuConfiguracoes"]

${button_suporte_menu}    //*[@resource-id="ButtonMenuSuporte"]

${button_transacoes_stone_menu}    //*[@resource-id="ButtonMenuTransações"]

${button_sair_app_menu}    //*[@resource-id="ButtonMenuExit"]

${text_modal_login_sair}    //*[@resource-id="LoginTextModal"]

${button_confirm_modal_login_sair}   //*[@resource-id="LoginButtonSuccess"] 

${button_dimiss_modal_login_sair}    //*[@resource-id="LoginButtonDismissModal"]

${text1_login_modal_permissao}    LoginAlertRestrictedTextInfoFirst

${text2_login_modal_permissao}    LoginAlertRestrictedTextInfoSecond

${button_select_operador_modal_permissao}    //*[@resource-id="LoginAlertRestrictedSelectedButtonOperador"]

${select_options_operadores_permissao}    //*[@resource-id="LoginAlertRestrictedSelectedButtonOperadorRender1"]    # É uma lista de arrays então começa do 0 como o primeiro da lista e assim sucessivamente.

${scroll_select_operadores_permissao}    //*[@resource-id="LoginAlertRestrictedScrollView"]    #vai ser usado para clicar nele e arrastar e mostrar as outras opções

${input_senha_operador_modal_permissao}    //*[@resource-id="LoginAlertRestrictedInputSenha"]

${button_confirm_modal_permissao}   //*[@resource-id="LoginAlertRestrictedButtonSuccess"] 

${button_dimiss_modal_permissao}    //*[@resource-id="LoginAlertRestrictedButtonDismiss"]

${text_header_fail_modal_permissao}    //*[@resource-id="LoginTitleAlert"]   

${text_info_fail_modal_permissao}    //*[@resource-id="LoginTextInfoAlert"]   

${button_confirm_fail_modal_permissao}    //*[@resource-id="LoginButtonAlert"]


*** Keywords ***

Open menewapp
  Open Application   ${REMOTE_URL}
              ...    platformName=${PLATFORM_NAME}
              ...    platformVersion=${PLATFORM_VERSION}
              ...    deviceName=${DEVICE_NAME}
              ...    app=${APP}
              ...    appPackage=${PACKAGE_NAME}
              ...    appActivity=${Activity_NAME}
              ...    appium:fullReset=${appiumreset}

Esperar carregar a tela de splash
    Sleep    5s

Preencher CNPJ/CPF
    Input Text    ${input_cnpj_cpf}    14749674000106
    Sleep    2s

Sincronizar CNPJ/CPF
    Click Element    ${button_sinc_dados}
    Sleep    5s

Clicar Fiscal
    Click Element    ${checkbox_fiscal}
    Sleep    2s

*** Test Cases ***
Cenário 1: Abrir app e realizar a primeira configuração
    Open menewapp
    Esperar carregar a tela de splash
    Preencher CNPJ/CPF
    Sincronizar CNPJ/CPF
    Clicar Fiscal
