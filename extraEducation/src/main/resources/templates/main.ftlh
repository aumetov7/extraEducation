<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">

<@c.page>
    <div class="form-row" xmlns="http://www.w3.org/1999/html">
        <div class="form-group col-md-6">
            <form method="get" action="/main" class="form-inline">
                <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Search by subject" />
                <button type="submit" class="btn btn-primary ml-2">Search</button>
            </form>
        </div>
    </div>

    <#if (isDirector || isAdmin)>
        <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">Add school</a>

        <div class="collapse <#if school??>show</#if>" id="collapseExample">
            <div class="form-group mt-3">
                <form method="post" enctype="multipart/form-data">
                    <div class="form-group col-sm-6">
                        <input type="text" class="form-control ${(nameError??)?string('is-invalid', '')}"
                               value="<#if school??>${school.name}</#if>" name="name" placeholder="Название школы" />
                        <#if nameError??>
                            <div class="invalid-feedback">
                                ${nameError}
                            </div>
                        </#if>
                    </div>
                    <div class="form-group col-sm-6">
<#--                        <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"-->
<#--                               value="<#if school??>${school.text}</#if>" name="text" placeholder="Описание" />-->
                        <textarea class="form-control ${(textError??)?string('is-invalid', '')}" name="text"
                                  placeholder="Описание" /><#if school??>${school.text}</#if></textarea>
                        <#if textError??>
                            <div class="invalid-feedback">
                                ${textError}
                            </div>
                        </#if>
                    </div>
                    <div class="form-group col-sm-6">
                        <input type="text" class="form-control ${(tagError??)?string('is-invalid', '')}"
                               value="<#if school??>${school.tag}</#if>" name="tag" placeholder="Предмет подготовки"></input>
                        <#if tagError??>
                            <div class="invalid-feedback">
                                ${tagError}
                            </div>
                        </#if>
                    </div>
                    <div class="form-group col-sm-6">
                        <div class="custom-file">
                            <input type="file" name="file" id="customFile" />
                            <label class="custom-file-label" for="customFile">Choose file</label>
                        </div>
                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <input type="hidden" name="id" value="<#if school??>${school.id}</#if>" />
                    <div class="form-group col-sm-6">
                        <button type="submit" class="btn btn-primary">Confirm</button>
                    </div>
                </form>
            </div>
        </div>

    </#if>

    <#include "parts/schoolList.ftlh" />


</@c.page>