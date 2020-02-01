<#import "common.ftlh" as c>
<#include "security.ftlh">

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
                    <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                           value="<#if school??>${school.text}</#if>" name="text" placeholder="Описание" />
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