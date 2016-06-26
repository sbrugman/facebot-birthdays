*** Settings ***
Library      	Selenium2Library
Library      	XvfbRobot
Library		Collections
Library		String
Library         OperatingSystem
Library		Dialogs

*** Keywords ***
Strip String
    [Arguments]	${String}
    [Return]	${String.strip()}

# Setup/Teardown Keywords
Initialize
    Start Virtual Display    1920    1080
    Set Selenium Timeout     30s
    Sleep		3s
	
Terminate
    Close browser
	
# Browser Keywords
Open browser to 	
    [Arguments]		${Url}
    Open browser	 ${Url}
    Maximize Browser Window
	
# Shorthands
Element Exists
    [Arguments]  	${xpath}
    Sleep		1s
    ${count}=  		Get Matching Xpath Count  	${xpath}
    ${exists}=  	Evaluate  	${count} > 0
    [Return]  	${exists}

Wait and Click Element
    [Arguments]		${Locator}
    Wait Until Page Contains Element		${Locator}
    Click Element	${Locator}

Wait and Input Text
    [Arguments]		${Locator}	${Value}
    Wait Until Page Contains Element		${Locator}
    Input text		${Locator}		${Value}

Wait and Count Elements
    [Arguments]		${Locator}
    Sleep		1s
    ${count}=		Get Matching Xpath Count	${Locator}
    [Return]		${count}

# Shortkeys
Press Enter
    [Arguments]		${Locator}
    Press Key 		${Locator}	\\13

Press Keys
    [Arguments]		${Locator}	${Text}
    @{characters}= 	Split String To Characters	${Text}
    : FOR    ${character}    IN     @{characters}
    \    Press Key		${Locator}	${character}
    \    Sleep			1s
