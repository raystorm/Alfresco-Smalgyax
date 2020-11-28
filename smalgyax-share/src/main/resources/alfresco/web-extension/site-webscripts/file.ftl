<div class="form-field">
  <#if form.mode == "view">
    <div class="viewmode-field">
      <span class="viewmode-label">${field.label?html}:</span>
      <span class="viewmode-value">${field.value?html}</span>
    </div>
  <#else>
    <script type="text/javascript" src="/share/res/components/upload/dnd-upload.js"></script>
    <script type="text/javascript" src="/share/res/components/upload/file-upload.js"></script>
    <div id="${fieldHtmlId}-controls" class="browse-wrapper">
    <div class="center dnd-file-selection-control">
    <span class="yui-button yui-push-button alf-primary-button" 
          id="${fieldHtmlId}-button-overlay">
	   <span class="first-child dnd-file-selection-button-overlay-wrapper">
	     <button type="button" tabindex="0" id="${fieldHtmlId}-button-overlay-wrapper" 
	             class="dnd-file-selection-button-overlay">
	       Select file to upload<#if field.mandatory><span class="mandatory-indicator">*</span></#if>
	     </button>
	     <input type="file" multiple="" name="files[]" class="dnd-file-selection-button"
	            <#if field.disabled>disabled="true"</#if> >
	   </span>
    </span>
    </div>
    </div>
    </div>
    <div id="${fieldHtmlId}-filelist-table" 
         class="fileUpload-filelist-table yui-dt yui-dt-scrollable hidden">
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
     var fileUpload = new Alfresco.DNDUpload("${fieldHtmlId}-button-overlay");
     var uploadConfig =
     {
        //siteId: siteId,
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