<#include  "security.ftlh">
<#import "login.ftlh" as l>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/">Extra Education</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
<#--            <li class="nav-item">-->
<#--                <a class="nav-link" href="/">Home</a>-->
<#--            </li>-->
            <#if user?? && !isBan>
            <li class="nav-item">
                <a class="nav-link" href="/main">Schools</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/user-schools/${currentUserId}"><#if isDirector || isAdmin>My schools<#else>Subscribes</#if></a>
            </li>
            </#if>
            <#if isAdmin>
            <li class="nav-item">
                <a class="nav-link" href="/user">User list</a>
            </li>
            </#if>
            <#if user?? && name != "unknown" && !isBan>
                <li class="nav-item">
                    <a class="nav-link" href="/user/profile">Profile</a>
                </li>
            </#if>
        </ul>

        <#if !isBan>
        <div class="navbar-text mr-3">${name}</div>
            <#elseif isBan><div class="navbar-text mr-3">BANNED</div>
        </#if>

        <#if name != "unknown"><@l.logout/></#if>
        <#if name == "unknown"><@l.signin/></#if>
    </div>
</nav>