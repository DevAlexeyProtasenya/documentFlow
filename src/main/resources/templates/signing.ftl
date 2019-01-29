<#import  "parts/common.ftl" as c>
<@c.page>
<iframe src="/docs/${letter.filename}" width="800" height="500" style="margin-left: 20%"></iframe>

<form action="/letter" method="post">
    <input type="hidden" value="${letter.id}" name="letterId">
    <input type="hidden" value="${_csrf.token}" name="_csrf">
    <button class="btn btn-lg btn-success" style=" width: 100px; height: 40px; font-size:18px; padding-left: 5px;
     position: absolute; /* Абсолютное позиционирование */
    bottom: 3%; /* Положение от нижнего края */
    left: 60%;" type="submit">Подписать</button>
</form>
<form action="/letterCancel" method="post">
    <input type="hidden" value="${letter.id}" name="letterId">
    <input type="hidden" value="${_csrf.token}" name="_csrf">
    <button type="submit" class="btn btn-lg btn-danger" style="position: absolute; width: 100px; height: 40px; font-size:18px;
     padding-left: 9px;/* Абсолютное позиционирование */
    bottom: 3%; /* Положение от нижнего края */
    right: 22%;">Отменить</button>
</form>
</@c.page>