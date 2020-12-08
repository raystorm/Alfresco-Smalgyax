<!--
<html>
  <body>
    <form action="${url.service}" method="post" 
          enctype="multipart/form-data">
      < ! - -      
        <show id="cm:name"/>
        <show id="cm:content"     force="true" />
        <show id="cm:title"       force="true"/>
        <show id="cm:description" force="true"/>
        <show id="mimetype"/>
        <show id="app:editInline" force="true"/>

        <show id="smd:nahawt" force="true"/>
        <show id="smd:magon"  force="true"/>
      - - >
      File: <input type="file" name="file"><br>
      < ! - - name is set in the back-end from the file name  - - >      
      Title: <input name="title"><br>
      Description: <input name="description"><br>
      < ! - - mimetype is calculated in the back-end from the file - - >
      < ! - - TODO: Add other Fields Here. - - >
      <input name="nodeType" type="hidden" value="smd:amwaal">
      Nahawt (Title/Topic) <input name="smd:nahawt"><br> 
      Magon  (Description) <input name="smd:magon"><br> 
      <input type="submit" name="submit" value="Upload">
    </form>
  </body>
</html>
-->

<#include "/alfresco-template.ftl" />
<@templateHeader />

<@templateBody>
   <@markup id="alf-hd">
   <div id="alf-hd">
      <@region scope="global" id="share-header" chromeless="true"/>
   </div>
   </@>
   <@markup id="bd">
   <div id="bd">
      <div class="share-form">
         <@region id="create-content-mgr" scope="template" />
         <!-- < @ region id="create-content" scope="template"  / > -->
         <@standalone>
   <@markup id="css" >
      <#include "/org/alfresco/components/form/form.css.ftl"/>
   </@>
   
   <@markup id="js">
      <#include "/org/alfresco/components/form/form.js.ftl"/>
   </@>
   
   <@markup id="widgets">
      <@createWidgets/>
   </@>
   
   <@markup id="html">
     <@uniqueIdDiv>
         <#import "/org/alfresco/components/form/form.lib.ftl" as formLib />   
      
      <#assign formId=args.htmlid?js_string?html + "-form">
      <#assign formUI>true</#assign>
         
         <@formLib.renderFormsRuntime formId=formId />
               
   <div id="formId-container" class="form-container">
         <div id="${formId}-caption" class="caption">
            <span class="mandatory-indicator">*</span>Required Fields
         </div>
      
      <form id="form" method="POST" accept-charset="utf-8" 
            enctype="multipart/form-data" action="${url.service}" >
      
         <!--
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
            Description: <input name="description" /><br/>
            <!-- mimetype is calculated in the back-end from the file -->
            <!-- TODO: Add other Fields Here. -->
            <input name="nodeType" type="hidden" value="smd:amwaal" />
            Nahawt (Title/Topic) <input name="smd:nahawt" /><br/> 
            Magon  (Description) <input name="smd:magon" /><br/> 
         </div>
      
      <@renderFormButtons formId="form" />
         </form>
   </div> 
                  
      </@>
   </@>
</@>
         
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