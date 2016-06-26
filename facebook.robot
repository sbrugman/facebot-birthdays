*** Settings ***
Resource		./global_keywords.robot
Resource 		./facebook_keywords.robot

*** Keywords ***
Poke
    [Arguments]		${Name}
    Navigate to profile		${Name}
    Wait and click element		//a[@aria-label='Andere acties']
    #Wait and click element		//a//span[text()='Porren']

Send private message	
    [Arguments]		${Name}		${Message}
    Navigate to profile			${Name}
    Wait and click element		//a[text()='Bericht']
    Wait and Input Text			//div[@class='fbNubFlyoutInner']//textarea		${Message}
    Press Enter			//div[@class='fbNubFlyoutInner']//textarea
    Wait and Click Element		//div[@class='fbNubFlyoutInner']//a[contains(@class,'close button')]

Post on wall
    [Arguments]		${Name}		${Message}
    Navigate to profile			${Name}
    Wait and Click Element		//span[text()='Bericht']
    Wait and Input Text			//div[@contenteditable='true' and @role='combobox']		${SPACE}${Message}
    #Wait and Click Element		//button/span[text()='Plaatsen']
