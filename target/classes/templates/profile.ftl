<#import "parts/common.ftl" as c>

<@c.page>
<div class="container mt-5">
    <h5>${username}</h5>
    ${message?ifExists}
    <form method="post">
        <div class="form-group row">
            <label for="inputPassword" class="col-sm-2 col-form-label"> Пароль: </label>
            <div class="col-sm-5">
                <input type="password" name="password" class="form-control" placeholder="Пароль"/>
            </div>
        </div>
        <div class="form-group row">
            <label for="inputPassword" class="col-sm-2 col-form-label"> Email: </label>
            <div class="col-sm-5">
                <input type="email" name="email" class="form-control" placeholder="some@some.com" value="${email!''}"/>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="btn btn-primary" type="submit">Сохранить</button>
    </form>
</div>
</@c.page>