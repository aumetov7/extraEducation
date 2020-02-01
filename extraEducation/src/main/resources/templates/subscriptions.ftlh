<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">

<@c.page>
    <h3>${userChannel.username}</h3>
    <div>${type}</div>
    <ul class="list-group">
        <#list users as user>
            <li class="list-group-item">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">User name</th>
                        <th scope="col">First Name</th>
                        <th scope="col">Last Name</th>
                        <th scope="col">Phone number</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><a href="/user-schools/${user.id}">${user.getUsername()}</a></td>
                            <td>${user.getFirstName()}</td>
                            <td>${user.getLastName()}</td>
                            <#if isDirector || isAdmin><td>${user.getNumber()}</td></#if>
                        </tr>
                    </tbody>
                </table>
            </li>
        </#list>
    </ul>
</@c.page>