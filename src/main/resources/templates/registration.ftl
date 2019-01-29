<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
<div class="container mt-5">
    <#--<div class="mb-1">Регистрация</div>-->
    ${message?ifExists}
    <@l.login "/registration" true/>
</div>
</@c.page>