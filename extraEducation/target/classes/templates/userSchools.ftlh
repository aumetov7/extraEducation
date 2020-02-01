<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">

<@c.page>
    <h3>${userChannel.username}</h3>
    <#if !isCurrentUser>
        <#if isSubscriber>
            <a class="btn btn-info" href="/user/unsubscribe/${userChannel.id}">Unsubscribe</a>
        <#else>
            <a class="btn btn-info" href="/user/subscribe/${userChannel.id}">Subscribe</a>
       </#if>
    </#if>
    <div class="container my-3">
        <div class="row">
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title">Subscriptions</div>
                        <h3 class="card-text">
                            <a href="/user/subscriptions/${userChannel.id}/list">${subscriptionsCount}</a>
                        </h3>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title">Subscribers</div>
                        <h3 class="card-text">
                            <a href="/user/subscribers/${userChannel.id}/list">${subscribersCount}</a>
                        </h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <#if isCurrentUser || isAdmin>
<#--        <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">School edit</a>-->
        <#include "parts/schoolEdit.ftlh" />
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
                        <a class="btn btn-danger" href="/school-delete/delete/${school.author.id}?school=${school.id}">
                            Delete
                        </a>
                    </#if>
                </div>
            </div>
        <#else>
            <#if isDirector || isAdmin>No schools</#if>
        </#list>
    </div>

</@c.page>