*** Settings ***
Library			Selenium2Library
Resource		./config.robot
Resource		./functions.robot
Suite Setup		Default Setup
Suite Teardown		Default Teardown

*** Test Cases ***
Automatically Poke Back
    Navigate to pokes
    ${count}=		Wait and Count Elements 		//div[contains(@id,'poke_live_item_')]
    :FOR 	${iterator}	IN RANGE	${count}
    \   ${iterator}=	Evaluate	${iterator}+1
    \   ${name}=	Get Text		//div[${iterator}][contains(@id,'poke_live_item_')]//div[@class='_6a _42us']//a
    \	${exists}=	Element Exists		//div[${iterator}][contains(@id,'poke_live_item_')]//a[text()='${btn_PokeBack}']
    \   Run Keyword If		${exists}	Log		You poked ${name}				level=WARN
    \   Run Keyword If		${exists}	Wait and Click Element		//div[${iterator}][contains(@id,'poke_live_item_')]//a[text()='${btn_PokeBack}']	
    [Teardown]		Navigate to homepage

Congratulate Birthday Boys and Girls
    Navigate to upcomming events page
    Navigate to all events page
    ${count}=		Wait and Count Elements		//div[@id='events_birthday_view']//div[@class='clearfix _3ng1']
    :FOR	${iterator}	IN RANGE	${count}
    \	${iterator}=	Evaluate	${iterator}+1
    \   ${name}=	Get Text	//div[@id='events_birthday_view']//div[${iterator}][@class='clearfix _3ng1']//div[contains(@class,'_3ng2')]//a
    \	${exists}=	Element Exists		//div[@id='events_birthday_view']//div[${iterator}][@class='clearfix _3ng1']//textarea
    \   Run Keyword If		'${message_type}'=='PM'		Send private message	${iterator}
    \	Run Keyword If		'${message_type}'=='Wall' and ${exists}		Post on wall 	${iterator}		
    \   Log		You congratulated ${name}				level=WARN
    [Teardown]		Navigate to homepage

*** Comments ***
# Wishlist Functions:
# * Like All Posts of person	${name}
# * Send message to Everyone	${message}	${date}
# * Like and Reply to All my Birthday Posts	${date}

# Wishlist Upgrades:
# * Replace [firstname] in messages
# * Detect if already send Message
# * Integrate SMS/WhatsApp (https://github.com/faucamp/python-gsmmodem)

*** Keywords ***
Get random birthday message
    ${count}=	Get Length	${messages_birthday}
    ${number}=		Get random number from 0 to ${count}
    [Return]	@{messages_birthday}[${number}]

Get random number from ${start} to ${end}
    ${number}=    Evaluate    random.sample(range(${start}, ${end}), 1)[0]    random
    [Return]	${number}

Open browser to facebook
    Open browser	http://www.facebook.com		Firefox
    Maximize Browser Window

Login
    Wait and Input Text		//input[@name='email']		${username}
    Wait and Input text		//input[@name='pass']		${password}
    Wait and Click element		//input[@value='${btn_SignOn}']

Logout
    Wait and Click Element		//div[@id='userNavigationLabel']
    Wait and Click Element		//span[text()='${lnk_SignOff}']

Navigate to homepage
    Wait and Click Element	//h1[@data-click='bluebar_logo']//a

Navigate to pokes
    Wait and Click Element	//span[text()='${lnk_Pokes}']

Navigate to upcomming events page
    Wait and Click Element	//span[text()='${lnk_Events}']

Navigate to all events page
    Wait and Click Element	//div[@id='pagelet_birthday_this_week']//a[text()='${lnk_ShowEverything}']

Send private message	
    [Arguments]		${iterator}
    ${message_birthday}=		Get random birthday message
    Mouse Over				//div[@id='events_birthday_view']//div[${iterator}][@class='clearfix _3ng1']//div[contains(@class,'_3ng2')]//a	
    Wait and Click Element		//a[text()='${btn_Message}']	
    Wait and Input Text			//div[@class='fbNubFlyoutInner']//textarea		${message_birthday} 			
    Press Enter				//div[@class='fbNubFlyoutInner']//textarea
    Wait and Click Element		//div[@class='fbNubFlyoutInner']//a[@class='close button']

Post on wall
    [Arguments]		${iterator}
    ${message_birthday}=		Get random birthday message
    Wait and Input Text		//div[@id='events_birthday_view']//div[${iterator}][@class='clearfix _3ng1']//textarea	${message_birthday}
    Press Enter			//div[@id='events_birthday_view']//div[${iterator}][@class='clearfix _3ng1']//textarea

Default Setup
    Open browser to facebook
    Login

Default Teardown
    Logout
    Close all browsers    
