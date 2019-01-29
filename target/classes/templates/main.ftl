<#include "parts/security.ftl">
<#import  "parts/common.ftl" as c>
<@c.page>
<#--<link rel="stylesheet" href="/static/css/twoColumns.css">-->
<link rel="stylesheet" href="/static/css/search.css">
<link rel="stylesheet" href="/static/css/secNavbar.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
      integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<#--<div class="mt-5" style="max-width: 1200px; margin-left: 75px">-->

<#--<div id="leftcol">-->
<div class="container-fluid">
    <div class="row">
        <div class="col-md-3 col-xs-1 p-l-0 p-r-0 collapse in" style="max-width: 19%" id="sidebar">
            <div class="list-group panel">
                <a href="/main" class="list-group-item collapsed" data-parent="#sidebar">Исходящие</a>
                <a href="/main/toMe" class="list-group-item collapsed" data-parent="#sidebar">Входящие</a>
                <a href="/main/unsigned" class="list-group-item collapsed" data-parent="#sidebar">Ожидающие
                    подписания</a>
                <a href="/main/signed" class="list-group-item collapsed" data-parent="#sidebar">Подписанные
                    документы</a></
            >
        </div>
    </div>
    <main class="col-md-9 col-xs-11 p-l-2 p-t-2" style="max-width: 80%; flex-grow: 0;
flex-shrink: 0;
flex-basis: 80%;">
        <a href="#sidebar" data-toggle="collapse"><i class="fa fa-bars" aria-hidden="true"></i></a>
        <hr>
    <#--</div>-->


    <#--<div id="rightcol">-->
    <#--<div class="row justify-content-center">-->

        <div class="col-12 col-md-10 col-lg-8" style="margin-bottom: 13px">
            <div class="row">
                <a class="btn btn-lg btn-success" style="width: 165px; height: 40px; font-size: 16px"
                   data-toggle="collapse" href="#collapseExample" role="button"
                   aria-expanded="false"
                   aria-controls="collapseExample">
                    Написать письмо
                </a>
                <form class="card card-sm" method="get" style="margin-left: 50px">

                    <div class="row no-gutters align-items-center">
                        <!--end of col-->
                        <div class="col">
                            <input name="search" style="height: 20px"
                                   class="form-control form-control-lg form-control-borderless"
                                   type="search" placeholder="Введите название">
                        </div>
                        <!--end of col-->
                        <div class="col-auto">
                            <button class="btn btn-lg btn-success" style="width: 165px; height: 40px; font-size: 16px"
                                    type="submit">Найти
                            </button>
                        </div>
                        <!--end of col-->
                    </div>
                </form>
            </div>
        </div>
        <!--end of col-->
    <#--</div>-->
        <div class="collapse <#if letter??>show</#if>" id="collapseExample">
            <div class="form-group mt-3">
                <form method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <input type="text" class="form-control ${(letternameError??)?string('is-invalid', '')}"
                               value="<#if letter??>${letter.lettername}</#if>" name="lettername"
                               placeholder="Введите название"/>
                <#if letternameError??>
                    <div class="invalid-feedback">
                        ${letternameError}
                    </div>
                </#if>
                    </div>
                <#--<div class="form-group">
                    <input type="text" class="form-control"
                           value="<#if letter??>${letter.date}</#if>" name="date"
                           placeholder="Enter the date of creating letter"/>
                </div>-->
                    <div class="form-group">
                        <label for="inputPassword" class="col-sm-4 col-form-label"> Получатель: </label>
                        <div class="col-sm-5">
                            <div class="form-group col-md-12">
                                <select name="profession" id="inputState" class="form-control">
                                    <option selected value="Директор">Директор</option>
                                    <option value="Бухгалтерия">Бухгалтерия</option>
                                    <option value="Финансовый отдел">Финансовый отдел</option>
                                    <option value="Кадровый отдел">Кадровый отдел</option>
                                    <option value="Информационный отдел">Информационный отдел</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="custom-file">
                            <input type="file" name="file" id="customFile">
                            <label class="custom-file-label" for="customFile">Выберите файл</label>
                        </div>
                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <div class="form-group">
                        <button class="btn btn-primary" type="submit">Добавить</button>
                    </div>
                </form>
            </div>
        </div>
    <#--    <#list letters as letter>
        <div>
            <b>${letter.id}</b>
            <b>${letter.lettername}</b>
            <div>
                <#if letter.filename??>
                    <img src="/img/${letter.filename}">
                </#if>
            </div>
        </div>
        </#list>-->

        <table class="table table-striped table-gray">
            <thead>
            <tr>
                <th>ID</th>
                <th>Название</th>
                <th>Дата создания</th>
                <th>Дата подписания</th>
                <th>Получатель</th>
                <th>Подписан</th>
                <th>Автор</th>
            <#if isAdmin>
                <th></th>
                <th></th>
            </#if>
            </tr>
            </thead>
            <tbody>
    <#list letters as letter>
    <tr>
        <td>${letter.id}</td>
        <td>${letter.lettername}</td>
        <td>${letter.dateTime}</td>
        <td><#if letter.signDate??>${letter.signDate}</#if></td>
        <td>${letter.profession}</td>
        <td>${letter.signed}</td>
        <td>${letter.author.username}</td>
        <#if isAdmin>
        <td>
            <form method="get" action="/main/${letter.id}">
                <button>Подписать</button>
            </form>
        </td>
        <td>
            <form action="/delete/${letter.id}" method="post">
                <input type="hidden" value="${letter.id}" name="letterId">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button type="submit">Удалить</button>
            </form>
        </td>
        </#if>
    </tr>
    </#list>
            </tbody>
        </table>
    </main>
</div>
</div>
<#--</div>-->
<#--</div>-->
</@c.page>
