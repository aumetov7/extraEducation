<#assign
    know = Session.SPRING_SECURITY_CONTEXT??
>

<#if know>
    <#assign
        user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
        name = user.getUsername()
        isAdmin = user.isAdmin()
        currentUserId = user.getId()
        >
    <#else>
    <#assign
        name = "unknown"
        isAdmin = false
        currentUserId = -1
        >
</#if>

<#if know>
    <#assign
        user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
        name = user.getUsername()
        isDirector = user.isDirector()
        currentUserId = user.getId()
    >
<#else>
    <#assign
        name = "unknown"
        isDirector = false
        currentUserId = -1
    >
</#if>

<#if know>
    <#assign
    user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    name = user.getUsername()
    isBan = user.isBan()
    currentUserId = user.getId()
    >
<#else>
    <#assign
    name = "unknown"
    isBan = false
    currentUserId = -1
    >
</#if>


