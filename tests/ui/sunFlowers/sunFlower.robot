***Settings***
Resource    base.robot
Resource    keywords/sunflower_keyword.robot
Test Setup          Abrir Aplicacao
Test Teardown       Fechar Aplicacao
Suite Setup             Carregar ScreenObject Sunflower

***Test Cases***

Verificar app com o jardim vazio
    Dado Que
    ...  Eu esteja na página principal
    Então   
    ...  Visualiza o jardim vazio

Vizualizar lista de plantas
    Dado Que
    ...  Eu esteja na página principal
    Quando
    ...  Entro na lista de plantas
    Então
    ...  Vizualizo pelo menos uma planta

Vizualizar o perfil de Apple
    Dado Que
    ...  Eu esteja na página principal
    Quando
    ...  Entro na lista de plantas
    ...  Entro no perfil de Apple
    Então  O perfil de Apple é exibido

Vizualizar a galeria de fotos de Apple
    Dado Que
    ...  Eu esteja na página principal
    Quando
    ...  Entro na lista de plantas
    ...  Entro no perfil de Apple
    ...  Clico em Galeria
    Então  a galeria sobre Apple é exibida

Compartillhar perfil da Apple
    Dado Que
    ...  Eu esteja na página principal
    Quando
    ...  Entro na lista de plantas
    ...  Entro no perfil de Apple
    ...  Clico em Compartillhar
    Então  é exibido opções de compartilhamento

Adicionar planta pelo perfil
    Dado Que
    ...  Eu esteja na página principal
    Quando
    ...  Entro na lista de plantas
    ...  Entro no perfil de Apple
    ...  Clico em adicionar via perfil
    Então  é exibido snacbar confirmando

Adicionar planta pela home
    Dado Que
    ...  Eu esteja na página principal
    Quando
    ...  Clico em Adicionar pela home
    ...  Entro no perfil de Apple
    ...  Clico em adicionar via perfil
    ...  Retorno para home
    Então  Confirmo a planta adicionada