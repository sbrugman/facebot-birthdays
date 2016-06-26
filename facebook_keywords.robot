*** Keywords ***
Generate Birthday Message		
	[Arguments]	${Name}
	Navigate to profile	${Name}
	Wait and click element		//a[text()='Info']
	Wait and click element		//a/span[text()='Contact- en algemene gegevens']
	Sleep			3s
	${FirstName}=		Get Text 	//a/span[contains(text(),'Details over ')]
	${FirstName}=		Remove String	${FirstName}		Details over${SPACE}
	#Log		${FirstName}		WARN
	#${Birthday}=		Get Text	//span[text()='Geboortedatum']/../../../div//span[not(text() = 'Geboortedatum')]
	#Log		${Birthday}		WARN
	#${Gender}=		Get Text	//span[text()='Geslacht']/../../../div//span[not(text() = 'Geslacht')]
	#Log		${Gender}		WARN
	${Message}=				Set variable			Gefeliciteerd ${FirstName}!
	[Return]	${Message}

Login
    Wait and Input Text		${input email}		${Username}
    Wait and Input text		${input password}		${Password}
    Wait and Click element		${button login}

Logout
    Wait and Click Element		${menu arrow}
    Wait and Click Element		${link logout}

Navigate to homepage
    Wait and Click Element	${link logo}

Navigate to pokes
    Wait and Click Element	${link pokes}

Navigate to upcomming events page
    Wait and Click Element	${link events}

Navigate to all events page
    Wait and Click Element	${link show all}

Navigate to profile
    [Arguments]		${Query}
    Wait and Input Text			${input search}		${Query}
    Press Enter				${input search}
    ${onProfile}=		Element exists		//a[text()='Tijdlijn']
    Run keyword unless		${onProfile}		Wait and click element		//a/div/div/div[text()='${Query}']
	
Facebook Setup
    Initialize
    Open browser to		http://www.facebook.com
    Login
	
Facebook Teardown
    Logout
    Terminate
	
*** Variables ***
# GUI variables
${link events}			//span[text()='Evenementen']
${input email}			//input[@name='email']
${input password}		//input[@name='pass']
${button login}			//input[@value='Log In']
${menu arrow}			//div[@id='userNavigationLabel']
${link logout}			//span[text()='Afmelden']
${link pokes}			//a//span[text()='Porren']
${link logo}			//h1[@data-click='bluebar_logo']//a
${link show all}		//div[@id='pagelet_birthday_this_week']//a[text()='Alles weergeven']
${div pokes}			//div[contains(@id,'poke_live_item_')]
${div birthdays}		//div[@id='events_birthday_view']//div[text()='Vandaag jarig']/../..//div[@class='clearfix _3ng1']
${input search}			//input[@id='q']

# Global Arguments
${Username}				[username]			
${Password}				[password]
