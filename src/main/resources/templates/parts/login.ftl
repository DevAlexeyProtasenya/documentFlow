<#macro login path isRegisterForm>
<link rel="stylesheet" href="/static/css/login.css">
    <form action="${path}" method="post">
    <#--<div class="form-group row">
        <label for="staticEmail" class="col-sm-2 col-form-label"> Логин: </label>
        <div class="col-sm-5">
            <input type="text" class="form-control ${(usernameError??)?string('is-invalid', '')}"
                   name="username" value="<#if user??>${user.username}</#if>" aria-describedby="emailHelp" placeholder="Введите логин"/>
            <#if usernameError??>
            <div class="invalid-feedback">
                ${usernameError}
            </div>
            </#if>
        </div>
    </div>
    <div class="form-group row">
        <label for="inputPassword" class="col-sm-2 col-form-label"> Пароль: </label>
        <div class="col-sm-5">
            <input type="password" name="password"
                   class="form-control ${(passwordError??)?string('is-invalid', '')}"
                   placeholder="Введите пароль"/>
            <#if passwordError??>
            <div class="invalid-feedback">
                ${passwordError}
            </div>
            </#if>
        </div>
    </div>-->
        <div class="container">
            <div class="row">
                <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                    <div class="card card-signin">
                        <div class="card-body">
                            <h5 class="card-title text-center"><#if !isRegisterForm>
                                Авторизация</#if><#if isRegisterForm>Регистрация</#if></h5>
                            <div class="form-label-group">
                            <#--<input type="email" id="inputEmail" class="form-control" placeholder="Email address"
                                   required autofocus>-->
                                <input type="text" id="inputEmail"
                                       class="form-control ${(usernameError??)?string('is-invalid', '')}"
                                       name="username" value="<#if user??>${user.username}</#if>"
                                       aria-describedby="emailHelp" placeholder="Введите логин"/>
                                <label for="inputEmail">Введите логин</label>
                                <#if usernameError??>
                                <div class="invalid-feedback">
                                    ${usernameError}
                                </div>
                                </#if>
                            </div>
                            <div class="form-label-group">
                            <#--<input type="password" id="inputPassword" class="form-control" placeholder="Password"
                                   required>-->
                                <input type="password" id="inputPassword" name="password"
                                       class="form-control ${(passwordError??)?string('is-invalid', '')}"
                                       placeholder="Введите пароль"/>
                                <label for="inputPassword">Введите пароль</label>
                                <#if passwordError??>
                                    <div class="invalid-feedback">
                                        ${passwordError}
                                    </div>
                                </#if>
                            </div>
                            <#if isRegisterForm>
                                <div class="form-label-group">
                                    <input type="password" name="password2" id="inputPassword"
                                           class="form-control ${(password2Error??)?string('is-invalid', '')}"
                                           placeholder="Введите пароль снова"/>
                                            <#if password2Error??>
                                            <div class="invalid-feedback">
                                                ${password2Error}
                                            </div>
                                            </#if>
                                    <label for="inputPassword">Введите пароль снова</label>
                                </div>
                                <div class="form-label-group">
                                    <input type="email" name="email" id="inputEmail"
                                           class="form-control ${(emailError??)?string('is-invalid', '')}"
                                           value="<#if user??>${user.email}</#if>" placeholder="Email:"/>
                                    <#if emailError??>
                                        <div class="invalid-feedback">
                                            ${emailError}
                                        </div>
                                    </#if>
                                    <label for="inputEmail">Введите Email</label>
                                </div>
                                <div class="form-label-group">
                                    <div class="form-group col-md-8">
                                        <select name="profession" id="inputState" class="form-control">
                                            <option selected value="Бухгалтерия">Бухгалтерия</option>
                                            <option value="Финансовый отдел">Финансовый отдел</option>
                                            <option value="Кадровый отдел">Кадровый отдел</option>
                                            <option value="Информационный отдел">Информационный отдел</option>
                                        </select>
                                    </div>
                                </div>
                            </#if>
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                <#if !isRegisterForm><a href="/registration">Регистрация</a></#if>
                                <#if isRegisterForm><a href="/login">Авторизация</a></#if>
                            <button class="btn btn-primary" type="submit"><#if isRegisterForm>Создать<#else>
                                Войти</#if></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <#--<#if isRegisterForm>
    <div class="form-group row">
        <label for="inputPassword" class="col-sm-2 col-form-label"> Пароль (повторить): </label>
        <div class="col-sm-5">
            <input type="password" name="password2" class="form-control ${(password2Error??)?string('is-invalid', '')}"
                   placeholder="Введите пароль снова"/>
                <#if password2Error??>
                <div class="invalid-feedback">
                    ${password2Error}
                </div>
                </#if>
        </div>
    </div>
        <div class="form-group row">
            <label for="inputPassword" class="col-sm-2 col-form-label"> Email: </label>
            <div class="col-sm-5">
                <input type="email" name="email" class="form-control ${(emailError??)?string('is-invalid', '')}"
                       value="<#if user??>${user.email}</#if>" placeholder="some@some.com"/>
            <#if emailError??>
                <div class="invalid-feedback">
                    ${emailError}
                </div>
            </#if>
            </div>
        </div>
    <div class="form-group row">
        <label for="inputPassword" class="col-sm-2 col-form-label"> Отдел: </label>
        <div class="col-sm-5">
            <div class="form-group col-md-8">
                <select name="profession" id="inputState" class="form-control">
                    <option selected value="Бухгалтерия">Бухгалтерия</option>
                    <option value="Финансовый отдел">Финансовый отдел</option>
                    <option value="Кадровый отдел">Кадровый отдел</option>
                    <option value="Информационный отдел">Информационный отдел</option>
                </select>
            </div>
        </div>
    </div>
    </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <#if !isRegisterForm><a href="/registration">Регистрация</a></#if>
        <#if isRegisterForm><a href="/login">Авторизация</a></#if>
        <button class="btn btn-primary" type="submit"><#if isRegisterForm>Создать<#else>Войти</#if></button>-->
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="btn btn-primary" type="submit">Sign out</button>
    </form>
</#macro>