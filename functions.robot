*** Keywords ***
Element Exists
    [Arguments]  	${xpath}
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

Press Enter
    [Arguments]		${Locator}
    Press Key 		${Locator}	\\13
