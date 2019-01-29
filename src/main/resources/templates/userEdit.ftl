<#import  "parts/common.ftl" as c>
<@c.page>
<h3 align="center">Редактирование пользователя</h3>
<div style="position: fixed; left: 40%; top: 15%">

    <br>
    <form action="/user" method="post">
        <div class="form-group">
            <label for="exampleInputEmail1">Изменить логин:</label>
            <input type="text" style="width: 200px" class="form-control" name="username" value="${user.username}">
        </div>
        <div class="form-group">
    <#list roles as role>
        <div>
            <label><input type="checkbox"
                          name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
        </div>
    </#list>
        </div>
        <div class="form-group">
            <input type="hidden" value="${user.id}" name="userId">
        </div>
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button class="btn btn-primary" type="submit">Сохранить</button>
    </form>
</div>
</@c.page>