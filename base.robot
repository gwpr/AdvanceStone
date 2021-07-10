***Settings***
Library     AppiumLibrary 
Library     RequestsLibrary
Library     Collections
Library     String 
Library     BuiltIn
Library     DebugLibrary
Library     JSONLibrary
Library     ${CURDIR}/lib/HelpersScreenObject.py

Resource    ${CURDIR}/tests/ui/bdd.robot

***Keywords****
Abrir Aplicacao
    Open Application     http://localhost:4723/wd/hub
    ...                 automationName=UiAutomator2
    ...                 platformName=Android
    ...                 deviceName=Android Emulator
    ...                 app=${EXECDIR}/app/sunflower.apk
    ...                 appPackage=com.google.samples.apps.sunflower
    ...                 appActivity=com.google.samples.apps.sunflower.GardenActivity
    ...                 autoAcceptAlerts=true
    ...                 autoGrantPermissions=true

Fechar Aplicacao
    Close Application