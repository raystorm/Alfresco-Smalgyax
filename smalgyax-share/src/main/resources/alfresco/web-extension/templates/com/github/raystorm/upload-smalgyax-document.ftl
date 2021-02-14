<#include "/org/alfresco/include/alfresco-template.ftl" />
<#-- From 4.2 and onwards configuration -->


<@templateHeader>
  <link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" 
         rel="stylesheet" />
  <style type="text/css" >
    table { font-size: 1em; }

    .ui-draggable, .ui-droppable { background-position: top; }       
  </style>
</@>

<@templateBody>
   <@markup id="alf-hd">
   <!-- add upload-smalgyax-document JS file -->
   <@script type="text/javascript" group="template-common" 
            src="/com/github/raystorm/upload-smalgyax-document-min.js" />
   <div id="alf-hd">
      <@region scope="global" id="share-header" chromeless="true"/>
   </div>
   </@>
   <@markup id="bd">
    <div id="bd">
      <#import "/org/alfresco/components/form/form.lib.ftl" as formLib />   

      <#assign formId="form">
      <#assign formUI>true</#assign>
                       
   <div id="formId-container" class="form-container">
         <div id="${formId}-caption" class="caption">
            <span class="mandatory-indicator">*</span>Required Fields
         </div>
      
      <form id="form" method="POST" accept-charset="utf-8" 
            enctype="multipart/form-data" > 
            <!--  action="/share/service/hayts" > -->
        <div id="form-messages" style="display:none" title="Upload file result">
          <div>Replace with an Error Message</div>
        </div>
      
      <!-- page.url.args.destination -->
      <#if page?? && page.url?? && page.url.args?? && page.url.args.destination?? 
        && page.url.args.destination?length &gt; 0>
         <input id="formId-destination" name="alf_destination" type="hidden" 
                value="${page.url.args.destination?html}" />
      </#if>
      
         <!-- TODO: pass file destination
         <input id="form-destination" name="alf_destination" type="hidden" 
                value=" $ { form.destination?html } " />
         <input id="form-redirect" name="alf_redirect" type="hidden" 
                value=" $ { form.redirect?html } " />
         -->         
         <div id="formId-fields" class="form-fields">
            <div id="${formId}-fields" class="form-fields">
            File: <input type="file" name="file" /><br/>
            <!-- name is set in the back-end from the file name  -->
            Title: <input name="title" /><br/>
            Description: 
            <textarea id="default_prop_cm_description" name="description" 
                      rows="3" cols="60" tabindex="0" 
                      title="Content Description" maxlength="1024"></textarea></br>
            <!-- mimetype is calculated in the back-end from the file -->
            <!-- TODO: Add other Fields Here. -->
            <input name="nodeType" type="hidden" value="smd:amwaal" />
            <p>
            <strong>BC Orthography</strong><br/>
            Nahawt (Title/Topic) <input name="smd:nahawt-bc" /><br/> 
            Magon (Description) 
            <textarea id="default_prop_smd_magon" name="smd:magon-bc" 
                      rows="3" cols="60" tabindex="0" 
                      title="Ts'aaw Magon" maxlength="1024"></textarea></br>
            </p>
            <p>
            <strong>AK Orthography</strong><br/>
            Nahawt (Title/Topic) <input name="smd:nahawt-ak" /><br/> 
            Magon (Description) 
            <textarea id="default_prop_smd_magon" name="smd:magon-ak" 
                      rows="3" cols="60" tabindex="0" 
                      title="Ts'aaw Magon" maxlength="1024"></textarea></br>
            </p>
         </div>
      
      <div id="default-form-buttons" class="form-buttons">
        <span class="yui-button yui-submit-button alf-primary-button" 
              id="default-form-submit">
          <span class="first-child">
            <button type="button" tabindex="0" id="default-form-submit-button" 
                    name="submit">
                    Upload
              <img id="ProcessingImage" alt="Processing" style="display: none;"
                   src="/share/res/components/images/lightbox/loading.gif">
            </button>
          </span>
        </span>&nbsp;
        <span class="yui-button yui-push-button" 
              id="default-form-cancel">
          <span class="first-child">
            <button type="reset" tabindex="0" id="default-form-reset-button" 
                    name="reset">Reset</button>
          </span>
        </span>
      </div>
      
         </form>
         <script type="text/javascript" >
           //wire up the button to submit the form
			  window.onload(Smalgyax.forms.prepare.addEventHandler());
         </script>
      </div>
    </div>
   </@>
</@>

<@templateFooter>
   <@markup id="alf-ft">
   <div id="alf-ft">
      <@region id="footer" scope="global" />
   </div>
   </@>
</@>
