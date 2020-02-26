<#include "security.ftlh">

<div class="card-columns" id="school-list">
    <#list schools as school>
        <div class="card my-3" data-id="${school.id}">
            <#if school.filename??>
                <img src="/img/${school.filename}" class="card-img-top" />
            </#if>
            <div class="m-2">
                <h4 class="card-title">${school.name}</h4><br/>
                <#--                <a href="/user-schools/${school.author.id}">${school.name}</a><br/>-->
                <h6 class="card-subtitle mb-2 text-muted">#${school.tag}</h6>
            </div>
            <div class="card-footer text-muted">
                <a href="/user-schools/${school.author.id}">${school.authorName}</a>
                <#if (school.author.id == currentUserId) || isAdmin>
                    <a class="btn btn-primary" href="/user-schools/${school.author.id}?school=${school.id}">
                        Edit
                    </a>
                </#if>
            </div>
        </div>
    <#else>
        No schools
    </#list>
</div>