*** Settings ***
Library    Collections
Library    DynamicTestGenerator
Resource    variables.robot
Suite Setup    Suite Setup


*** Test cases ***
Placeholder test
    Log    Placeholder test required by Robot Framework
    
*** Keywords ****
Suite Setup
    Generate Test Cases    example_keyword    [\\d\\w]{10}    10
    Generate Test Cases    example_keyword    [\\w\\p]{10}&[\\p]{2}    10
    Generate Test Cases    example_keyword    [\\c]{10}.[\\c]{5:10}@[\\c]{3:12}.(com|net|org)    10
    Generate Test Cases    example_keyword    [\\l\\d]{4:18}&[\\d]&[\\p]    20
    Generate Test Cases    example_keyword    [a-z]{4}|[0-9]{4:400}    50
    Generate Test Cases    example_keyword    [\\w\\p\\d]{20}    10
    Generate Test Cases    example_keyword    [\\w\\p]{1:10}&[\\p]{2:10}    100
	
Generate Random String From Regexp
    [Arguments]    ${regexp}
    ${random} =    Evaluate    strgen.StringGenerator("${regexp}").render()    modules=strgen
    [Return]    ${random}    


Generate Test Cases
    [Arguments]    ${case}    ${regexp}    ${cardinality}
    :FOR    ${i}    IN RANGE    ${cardinality}
    \   ${random}    Generate Random String From Regexp    ${regexp}
    \   Add test case   ${case} - ${random}
    \   ...             Log    ${random}
    

    
    


