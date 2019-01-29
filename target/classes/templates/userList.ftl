<#import  "parts/common.ftl" as c>
<@c.page>
<div class="container mt-5">

    <h3>Список пользователей:</h3>
    <br>

    <table class="table table-striped table-gray">
        <thead>
        <tr>
            <th>Имя</th>
            <th>Роли</th>
            <th>Отдел</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
    <#list users as user>
    <tr>
        <td>${user.username}</td>
        <td><#list user.roles as role>${role}<#sep>, </#list></td>
        <td>${user.profession}</td>
        <td><a href="/user/${user.id}">Редактировать</a></td>
    </tr>
    </#list>
        </tbody>
    </table>
</div>
</@c.page>