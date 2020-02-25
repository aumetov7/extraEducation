<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">

<@c.page>
    <#if isCurrentUser || isAdmin>
    <#--        <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">School edit</a>-->
        <div class="collapse <#if school??>show</#if>" id="collapseExample">
            <div class="form-group mt-3">
                <form method="post" enctype="multipart/form-data">
                    <div class="form-group col-sm-6">
                        <h4 class="card-title text-center">${school.name}</h4>
                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <input type="hidden" name="id" value="<#if school??>${school.id}</#if>" />
                    <div class="form-group col-sm-6">
                        <button type="submit" class="btn btn-danger">DELETE</button>
                    </div>
                </form>
            </div>
        </div>
    </#if>

    <div class="card-columns">
        <#list schools as school>
            <div class="card my-3">
                <#if school.filename??>
                    <img src="/img/${school.filename}" class="card-img-top">
                </#if>
                <div class="m-2">
                    <h4 class="card-title">${school.name}</h4>
                    <h6 class="card-title">${school.text}</h6><br/>
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
            <#if isDirector || isAdmin>No schools</#if>
        </#list>
    </div>

</@c.page>