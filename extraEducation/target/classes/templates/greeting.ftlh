<#import "parts/common.ftlh" as c>
<#include  "parts/security.ftlh">

<@c.page>
    <#if !isBan>
<h5>Hello<#if name != 'unknown'>, ${name}</#if></h5>
    <div>This is a simple web app which helps you to get Extra Education</div>
        <#else><h5>${name}, YOU ARE BANNED!</h5>
    </#if>
</@c.page>