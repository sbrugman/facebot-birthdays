*** Settings ***
Resource		./global_keywords.robot
Resource 		./facebook_keywords.robot

*** Test Cases ***
Pokes
    #[Timeout]	10 minutes
    [Setup]		  Facebook Setup
    Execute JavaScript    window.scrollTo(0, 200)
    Navigate to pokes
    ${count}=		Wait and Count Elements 		${div pokes}
    :FOR 	${iterator}	IN RANGE	${count}
    \   ${iterator}=	Evaluate	${iterator}+1
    \   ${Name}=	Get Text		//div[${iterator}][contains(@id,'poke_live_item_')]//div[@class='_6a _42us']//a
    \	${exists}=	Element Exists		//div[${iterator}][contains(@id,'poke_live_item_')]//a[text()='Terugporren']
    \	Run keyword if		${exists}	Log		${Name}		WARN
    \	Run keyword if		${exists}	Poke		${Name}
    [Teardown]		Run keywords		Facebook Teardown
