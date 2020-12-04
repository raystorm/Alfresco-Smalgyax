<div class="form-field">
  <#if form.mode == "view">
    <div class="viewmode-field">
      <span class="viewmode-label">${field.label?html}:</span>
      <span class="viewmode-value">${field.value?html}</span>
    </div>
  <#else>
    <script type="text/javascript" src="/share/res/components/upload/dnd-upload.js"></script>
    <script type="text/javascript" src="/share/res/components/upload/file-upload.js"></script>
    <div class="bd" >
	   <div id="${fieldHtmlId}-file-selection-controls" class="browse-wrapper">
		  <div class="center dnd-file-selection-control">
		    <span class="yui-button yui-push-button alf-primary-button" 
		          id="${fieldHtmlId}-file-selection-button-overlay">
			   <span class="first-child dnd-file-selection-button-overlay-wrapper">
			     <button id="${fieldHtmlId}-file-selection-button-overlay-wrapper"
			             type="button" tabindex="0" class="dnd-file-selection-button-overlay">
			       Select file to upload<#if field.mandatory><span class="mandatory-indicator">*</span></#if>
			     </button>
			     <input id="${fieldHtmlId}" type="file" multiple="" name="files[]"			             
			            class="dnd-file-selection-button"
			            <#if field.disabled>disabled="true"</#if> >
			   </span>
		    </span>
	     </div>
	   </div>
    <div id="${fieldHtmlId}-filelist-table" 
         class="fileUpload-filelist-table yui-dt yui-dt-scrollable hidden">      
      <div class="yui-dt-mask" style="display: none;"></div>
      <div style="width: 620px; background-color: rgb(242, 242, 242);" 
           class="yui-dt-hd">
        <table>
          <colgroup><col><col><col></colgroup>
          <thead style="">
            <tr class="yui-dt-first yui-dt-last">
              <th id="yui-dt46-fixedth-id" 
                  rowspan="1" colspan="1" class="col-left yui-dt46-col-id yui-dt-col-id">
                <div id="yui-dt46-th-id-liner" class="yui-dt-liner">
                  <span class="yui-dt-label">id</span>
                </div>
              </th>
              <th id="yui-dt46-fixedth-name" rowspan="1" colspan="1" 
                  class="col-center yui-dt46-col-name yui-dt-col-name">
                <div id="yui-dt46-th-name-liner" class="yui-dt-liner">
                  <span class="yui-dt-label">name</span>
                </div>
              </th>
              <th id="yui-dt46-fixedth-created" rowspan="1" colspan="1" 
                  class="col-right yui-dt46-col-created yui-dt-col-created" 
                  style="border-right: 1px solid rgb(242, 242, 242);">
                <div id="yui-dt46-th-created-liner" class="yui-dt-liner">
                  <span class="yui-dt-label">created</span>
                </div>
              </th>
            </tr>
          </thead>
        </table>
      </div>
      <div style="width: 620px; height: 204px;" class="yui-dt-bd">
        <table summary="" style="margin-top: 0px; width: 155px;">
          <thead>
            <tr>
              <th id="yui-dt46-th-id" rowspan="1" colspan="1" class="yui-dt-first">id</th>
              <th id="yui-dt46-th-name" rowspan="1" colspan="1">name</th>
              <th id="yui-dt46-th-created" rowspan="1" colspan="1" class="yui-dt-last">created</th>
            </tr>
          </thead>
          <tbody class="yui-dt-message" style="">
            <tr class="yui-dt-first yui-dt-last">
              <td colspan="3" class="yui-dt-first yui-dt-last">
                <div class="yui-dt-liner yui-dt-loading yui-dt-empty">Loading files into memory, please wait...</div>
              </td>
            </tr>
          </tbody>
          <tbody tabindex="0" class="yui-dt-data"></tbody>
        </table>
      </div>
    </div>
    <div class="status-wrapper">
      <span id="${fieldHtmlId}-status-span" class="status">&nbsp;</span>
    </div>
    <div id="${fieldHtmlId}-versionSection-div" class="hidden">
      <div id="${fieldHtmlId}-compare-versions" class="hidden compare-versions">
         <div class="header">
              <div class="element"><h3>Current File</h3></div>
              <div class="element"><h3>New File</h3></div>
         </div>
         <div class="current-version element">
            <div class="details">
               <div>
                  <span>Current version:</span>
                  <span class="prop-value" id="${fieldHtmlId}-current-version-value"></span>
               </div>
               <div>
                  <span>Filename:</span>
                  <span class="prop-value" id="${fieldHtmlId}-current-version-filename"></span>
               </div>
               <div>
                  <span>Title:</span>
                  <span class="prop-value" id="${fieldHtmlId}-current-version-title"></span>
               </div>
               <div>
                  <span>Mimetype:</span>
                  <span class="prop-value" id="${fieldHtmlId}-current-version-mimetype"></span>
               </div>
               <div>
                  <span>Last modified:</span>
                  <span class="prop-value" id="${fieldHtmlId}-current-version-last-modified"></span>
               </div>
               <div>
                  <span>Modified by:</span>
                  <span class="prop-value" id="${fieldHtmlId}-current-version-modified-by"></span>
               </div>
            </div>
            <span>
            <img id="${fieldHtmlId}-current-version-icon">
            </span>
         </div>
          <div class="new-version element">
             <div class="details">
                <div class="">
                   <span>Filename:</span>
                   <span class="prop-value" id="${fieldHtmlId}-new-version-filename"></span>
                </div>
                <div>
                   <span>Mimetype:</span>
                   <span class="prop-value" id="${fieldHtmlId}-new-version-mimetype"></span>
                </div>
             </div>
             <span>
             <img id="${fieldHtmlId}-new-version-icon">
             </span>
          </div>
       </div>
       <div class="yui-g">
          <h2>New Version Information</h2>
       </div>
       <div class="yui-gd">
          <div class="yui-u first">
             <span>This version has:</span>
          </div>
          <div class="yui-u">
             <input id="${fieldHtmlId}-minorVersion-radioButton" type="radio" name="majorVersion" checked="checked" tabindex="0">
             <label for="${fieldHtmlId}-minorVersion-radioButton" 
                    id="${fieldHtmlId}-minorVersion">minor changes</label>
          </div>
       </div>
       <div class="yui-gd">
          <div class="yui-u first">&nbsp;
          </div>
          <div class="yui-u">
             <input id="${fieldHtmlId}-majorVersion-radioButton" type="radio" name="majorVersion" tabindex="0">
             <label for="${fieldHtmlId}-majorVersion-radioButton" id="template_x002e_dnd-upload_x002e_sharedfiles_x0023_default-majorVersion">major changes</label>
          </div>
       </div>
       <div class="yui-gd">
          <div class="yui-u first">
             <label for="${fieldHtmlId}-description-textarea">Comments</label>
          </div>
          <div class="yui-u">
             <textarea id="${fieldHtmlId}-description-textarea" name="description" cols="80" rows="4" tabindex="0"></textarea>
          </div>
       </div>
    </div>
    <div style="display:none">
      <div id="${fieldHtmlId}-left-div" class="fileupload-left-div">
        <span class="fileupload-percentage-span">0%</span>
        <input class="fileupload-contentType-input" type="hidden" value="cm:content">
      </div>
      <div id="${fieldHtmlId}-center-div" class="fileupload-center-div">
        <span class="fileupload-progressSuccess-span">&nbsp;</span>
        <img src="/share/res/components/images/generic-file-32.png" 
             class="fileupload-docImage-img" alt="file">
        <span class="fileupload-progressInfo-span"></span>
        <span class="fileupload-filesize-span"></span>
      </div>
      <div id="${fieldHtmlId}-right-div" class="fileupload-right-div">
        <img src="/share/res/components/images/job-running-16.png" 
             class="fileupload-status-img" alt="status-running">
        <img src="/share/res/components/images/complete-16.png" 
             class="fileupload-status-img hidden" alt="status-complete">
        <img src="/share/res/components/images/job-failed-16.png" 
             class="fileupload-status-img hidden" alt="status-failed">
      </div>
    </div>
    <div class="bdft" >
      <span id="${fieldHtmlId}-upload-button"
            class="yui-button yui-push-button alf-primary-button hidden 
                  yui-button-disabled yui-push-button-disabled" >
        <span class="first-child">
          <button id="${fieldHtmlId}-upload-button-button" 
                  type="button" tabindex="0" disabled="disabled">Upload</button>
        </span>
      </span>
    </div>
    </div>
    <!--
    <label for="fieldHtmlId">
      File to Be Uploaded:<#if field.mandatory><span class="mandatory-indicator">*</span></#if>
    </label>    
    <input id="fieldHtmlId" type="file" name="${field.name}"  
           class="dnd-file-selection-button" 
           < # i f field.disabled>disabled="true" < / # i f > />
    -->
    <script type="text/javascript" >
    if (Smalgyax === undefined || typeof Smalgyax == "undefined" || !Smalgyax) 
    {
        //TODO: prototype syntax
        var Smalgyax = {};
        Smalgyax.forms = {};
        Smalgyax.forms.prepare = {};
        Smalgyax.forms.helpers = {};
        Smalgyax.forms.event = {};
        Smalgyax.forms.validation = {};
    }

    /** Helper function to find the creation form */
    Smalgyax.forms.helpers.findCreationForm = function findCreationForm()
    {
       "use strict";
       
       var fi = 0;
       var form = null;
       for (fi = 0; fi < document.forms.length; ++fi) 
       {
          form = document.forms[fi];
          if (form.id.includes("create-content")) 
          { return form; }
       }
    }
    
    /** 
     * Helper function to find the needed input element on the form
     * @param form {HTMLFormElement} The forms runtime class instance the field is being managed by
     * @param inputName {String} part of the name element of the needed input element
     */
    Smalgyax.forms.helpers.findInput = function findInput(form, name)
    {
       "use strict";
       
       var i = 0;
       //find cm:name
       for (i = 0; i < form.elements.length; ++i) 
       { if (form.elements[i].name.includes(name)) { return form.elements[i]; } }
    }
    
    /**
     *  finds the create form and sets the cm:name field to read only     
     */
    Smalgyax.forms.prepare.setNameReadonly = function setNameReadOnly() 
    {
       "use strict";
       //find the creation form
        
       var form = Smalgyax.forms.helpers.findCreationForm();
       var input = Smalgyax.forms.helpers.findInput(form, "cm_name");
       input.readOnly = true;
       input.placeholder = "Field will match the FileName";
       
       return;
    }

    Smalgyax.forms.prepare.setNameReadonly();
    
    /**
     *  finds the create form and sets the cm:name field to read only     
     */
    Smalgyax.forms.event.onChangeEvent = function onChangeEvent(event) 
    {
       "use strict";

       //find the creation form        
       var form = Smalgyax.forms.helpers.findCreationForm();
       var nameField = Smalgyax.forms.helpers.findInput(form, "cm_name");
       var typeField = Smalgyax.forms.helpers.findInput(form, "mimetype");

       //set the name field to match the file name
       nameField.value = event.target.files[0].name;
       typeField.value = event.target.files[0].type;
    }
    
    /** Add the Event Handler to the File Control */
    Smalgyax.forms.prepare.addEventHandler = function addEventHandler()
    {
       "use strict";
       
       var form = Smalgyax.forms.helpers.findCreationForm();
       //var contentField = Smalgyax.forms.helpers.findInput(form, "cm_content");
       var contentField = Smalgyax.forms.helpers.findInput(form, "files[]");
       contentField.onchange = Smalgyax.forms.event.onChangeEvent;
    }
    
    //TODO: Window.onload or document ready here
    Smalgyax.forms.prepare.addEventHandler();
    
    /**
     * This Validator will set the cm:name[value] = the filename from cm:content
     * 
     * Validation handler for a field.
     * 
     * @param field {object} The element representing the field the validation is for
     * @param args {object} Object containing arguments for the handler
     * @param event {object} The event that caused this handler to be called, maybe null
     * @param form {object} The forms runtime class instance the field is being managed by
     * @param silent {boolean} Determines whether the user should be informed upon failure
     * @param message {string} Message to display when validation fails, maybe null
     * @static
     */
    Smalgyax.forms.validation.setNameValue = 
    function setNameValue(field, args, event, form, silent, message) 
    {
       "use strict";
        
       var creationform = Smalgyax.forms.helpers.findCreationForm();
       var nameField = Smalgyax.forms.helpers.findInput(form, "cm_name");
        
       if (nameField) 
       {
          nameField.value = field.files[0].name;
          return true;
       }

       message = "Cannot add a file when one has not been provided.";
       return false;
    }
     

    /*
     * var dndUpload = Alfresco.component.getDNDUploadInstance();
     * var multiUploadConfig =
     * {
     *    files: files,
     *    destination: destination,
     *    siteId: siteId,
     *    containerId: doclibContainerId,
     *    path: docLibUploadPath,
     *    filter: [],
     *    mode: flashUpload.MODE_MULTI_UPLOAD,
     * }
     * dndUpload.show(multiUploadConfig);
     */
     
     /*
     var dndUpload = Alfresco.component.getDNDUploadInstance();
     var fileToUpload = 
    	   {
    		   files: document.getElementById("${fieldHtmlId}").files,
    		   //destination: 
    			//siteId: 
    			//containerId: 
    			//path: 
    			filter: [], 
    			mode: flashUpload.MODE_SINGLE_UPLOAD,
    	   };
     dndUpload.show(fileToUpload);
     */
     
    /*
     * var fileUpload = Alfresco.getFileUploadInstance();
     * var multiUploadConfig =
     * {
     *    siteId: siteId,
     *    containerId: doclibContainerId,
     *    path: docLibUploadPath,
     *    filter: [],
     *    mode: fileUpload.MODE_MULTI_UPLOAD,
     * }
     * this.fileUpload.show(multiUploadConfig);
     */
     
     //var fileUpload = Alfresco.getFileUploadInstance();
     //var fileUpload = new Alfresco.DNDUpload("${fieldHtmlId}-button-overlay");
     var fileUpload = new Alfresco.DNDUpload("${fieldHtmlId}");     
     //var fileUpload = new Alfresco.DNDUpload("${fieldHtmlId}-controls");
     var uploadConfig =
     {
        //siteId: 'siteshome',
        //containerId: doclibContainerId,
        //path: docLibUploadPath,
        destination: '${form.destination}',
        filter: [],
        mode: fileUpload.MODE_SINLGLE_UPLOAD,
     }
     fileUpload.show(uploadConfig);
     
    </script>
  </#if>
</div>
