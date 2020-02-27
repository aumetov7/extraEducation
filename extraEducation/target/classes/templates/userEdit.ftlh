<#import "parts/common.ftlh" as c>

<@c.page>
<h2>User editor</h2>
    <table class="table">
    <form action="/user" method="post">
        <thead>
        <th scope="col">User name</th>
        <th scope="col">First name</th>
        <th scope="col">Last name</th>
        <th scope="col">Role</th>
        </thead>
        <tbody>
        <td><input type="text" name="username" value="${user.username}"></td>
        <td>${user.firstName}</td>
        <td>${user.lastName}</td>
        <#list roles as role>
            <td><div>
                <label><#if user.username != 'admin'><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}></#if>${role}</label>
            </div></td>
        </#list>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <td><#if user.username != 'admin'><button type="submit">Save</button></#if></td>
        </tbody>
    </form>
    </table>
</@c.page>



