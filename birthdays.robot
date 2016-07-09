*** Settings ***
Resource		./global_keywords.robot
Resource 		./facebook_keywords.robot
Resource		./facebook.robot

*** Test Cases ***
Birthday
    [Timeout]	30m
    [Setup]		Facebook Setup
    Navigate to upcomming events page
    Navigate to all events page
    ${count}=		Wait and Count Elements		${div birthdays}
    @{Names}=		Create List
    :FOR	${iterator}	IN RANGE	${count}
    \	${iterator}=	Evaluate	${iterator}+1
    \   ${name}=	Get Text	//div[@id='events_birthday_view']//div[text()='Vandaag jarig']/../..//div[${iterator}][@class='clearfix _3ng1']//div[contains(@class,'_3ng2')]//a
    \	${exists}=	Element Exists		//div[@id='events_birthday_view']//div[text()='Vandaag jarig']/../..//div[${iterator}][@class='clearfix _3ng1']//textarea
    \	Run keyword if		${exists}	Append To List		${Names}	${name}
    :FOR	${Name}		IN			@{Names}
    \   Log		${Name}		WARN
    \	${Message}=	Generate Birthday Message	${Name}
    \ 	Log		${Message}		WARN
    \   Send private message  	${Name}		${Message}
    [Teardown]		Facebook Teardown
