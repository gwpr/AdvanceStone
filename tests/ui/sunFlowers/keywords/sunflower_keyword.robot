***Settings***
Resource   ./base.robot

***Keywords****
Carregar ScreenObject Sunflower
    ${garden_screen}        get_screen_object       my_garden_screen
    ${plant_screen}         get_screen_object       plant_list_screen
    ${perfil_screen}        get_screen_object       perfil_plant
    ${gallery_screen}       get_screen_object       gallery_screen
    
    Set Suite Variable      ${garden_screen}
    Set Suite Variable      ${plant_screen}
    Set Suite Variable      ${perfil_screen}
    Set Suite Variable      ${gallery_screen}

Eu esteja na página principal
    Wait Until Page Contains    ${garden_screen.title_sunflower}   15

Entro na lista de plantas
    Wait Until Element Is Visible   ${garden_screen.btn_plant_list}
    Click Element     ${garden_screen.btn_plant_list}

Entro no perfil de Apple
    Wait Until Element Is Visible   ${plant_screen.plant_apple}
    Click Element     ${plant_screen.plant_apple}

O perfil de Apple é exibido
    Wait Until Element Is Visible   ${perfil_screen.txt_name_plant}
    Element Text Should Be    ${perfil_screen.txt_name_plant}   Apple

Clico em Galeria
    Wait Until Element Is Visible    ${perfil_screen.btn_galery}
    Click Element     ${perfil_screen.btn_galery}

a galeria sobre Apple é exibida
    Wait Until Element Is Visible   ${gallery_screen.title_galery}
    Element Text Should Be    ${gallery_screen.title_galery}   Photos by Unsplash

Clico em Compartillhar
    Wait Until Element Is Visible   ${perfil_screen.btn_share}
    Click Element     ${perfil_screen.btn_share}

Clico em adicionar via perfil
    Wait Until Element Is Visible   ${perfil_screen.btn_add}
    Click Element     ${perfil_screen.btn_add}

Clico em Adicionar pela home
    Wait Until Element Is Visible   ${garden_screen.btn_add}
    Click Element     ${garden_screen.btn_add}
Retorno para home
    Go Back
    Wait Until Element Is Visible   ${garden_screen.btn_my_garden}
    Click Element     ${garden_screen.btn_my_garden}

Confirmo a planta adicionada
    Wait Until Element Is Visible   ${garden_screen.txt_plant_name}
    Element Text Should Be    ${garden_screen.txt_plant_name}  Apple

é exibido snacbar confirmando
    Wait Until Element Is Visible   ${perfil_screen.txt_snackbar}
    Element Text Should Be   ${perfil_screen.txt_snackbar}   Added plant to garden

é exibido opções de compartilhamento
    Run keyword if  '${ENV_OS}' =='android'
    ...     Element Text Should Be ${perfil_screen.txt_share_android}   Share with

Vizualizo pelo menos uma planta
    Wait Until Element Is Visible    ${plant_screen.plant_apple}
    Element Text Should Be    ${plant_screen.plant_apple}   Apple

Visualiza o jardim vazio
    Wait Until Element Is Visible     ${garden_screen.txt_empty} 
    Element Text Should Be    ${garden_screen.txt_empty}   Your garden is empty

