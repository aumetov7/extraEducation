<#import "parts/common.ftlh" as c>

<@c.page>
    <h2>List of users</h2>

    <table class="table">
        <thead>
        <tr>
            <th scope="col">User name</th>
            <th scope="col">Role</th>
            <th scope="col">First Name</th>
            <th scope="col">Last Name</th>
            <th scope="col">Phone number</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
    <#list users as user>
        <tr>
            <td>${user.username}</td>
            <td><#list  user.roles as role>${role}<#sep>, </sep></#list></td>
            <td>${user.firstName}</td>
            <td>${user.lastName}</td>
            <td>${user.number}</td>
            <td><a href="/user/${user.id}">edit</a></td>
        </tr>
    </#list>
    </tbody>
    </table>
</@c.page>