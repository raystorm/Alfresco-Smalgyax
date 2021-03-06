<#import "/org/alfresco/components/form/form.lib.ftl" as formLib />

<#if error?exists>
   <div class="error">${error}</div>
<#elseif form?exists>

   <#assign formId=args.htmlid + "-form">
   <#assign formUI><#if args.formUI??>${args.formUI}<#else>true</#if></#assign>

   <#if formUI == "true">
      <@formLib.renderFormsRuntime formId=formId />
   </#if>
   
   <div id="${formId}-container" class="form-container">
      
      <#if form.showCaption?exists && form.showCaption>
         <div id="${formId}-caption" class="caption"><span class="mandatory-indicator">*</span>${msg("form.required.fields")}</div>
      </#if>
         
      <#if form.mode != "view">
         <form id="${formId}" method="${form.method}" accept-charset="utf-8" enctype="${form.enctype}" action="${form.submissionUrl}">
      </#if>
      
      <div id="${formId}-fields" class="form-fields"> 
        <#list form.items as item>
            <#if item.kind == "set">
               <@renderSetWithColumns set=item />
            <#else>
               <@formLib.renderField field=item />
            </#if>
         </#list>
      </div>
         
      <#if form.mode != "view">
         <@formLib.renderFormButtons formId=formId />
         </form>
      </#if>

   </div>
</#if>

<#macro renderSetWithColumns set>
   <#if set.appearance?exists>
      <#if set.appearance == "fieldset">
         <fieldset><legend>${set.label}</legend>
      <#elseif set.appearance == "panel">
         <div class="form-panel">
            <div class="form-panel-heading">${set.label}</div>
            <div class="form-panel-body">
      </#if>
   </#if>
   
   <#list set.children as item>
      <#if item.kind == "set">
         <@renderSetWithColumns set=item />
      <#else>
         <#if (item_index % 2) == 0>
         <div class="yui-g"><div class="yui-u first">
         <#else>
         <div class="yui-u">
         </#if>
         <@formLib.renderField field=item />
         </div>
         <#if ((item_index % 2) != 0) || !item_has_next></div></#if>
      </#if>
   </#list>
   
   <#if set.appearance?exists>
      <#if set.appearance == "fieldset">
         </fieldset>
      <#elseif set.appearance == "panel">
            </div>
         </div>
      </#if>
   </#if>
</#macro>