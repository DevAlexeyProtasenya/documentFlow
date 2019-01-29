<#import  "parts/common.ftl" as c>
<#import  "parts/login.ftl" as l>
<@c.page>
    Hello!
<div>
    <@l.logout/>
    <span><a href="/user">User list</a> </span>
</div>
<div>
    <form method="post" enctype="multipart/form-data">
        <input type="file" name="file">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit">Добавить</button>
    </form>
</div>
<#list letters as letter>
    <div>
        <b>${letter.id}</b>
        <div>
            <#if letter.filename??>
                <img src="/img/${letter.filename}">
            </#if>
        </div>
    </div>
</#list>



</@c.page>