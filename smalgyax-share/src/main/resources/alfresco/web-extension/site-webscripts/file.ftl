<div class="form-field">
  <#if form.mode == "view">
    <div class="viewmode-field">
      <span class="viewmode-label">${field.label?html}:</span>
      <span class="viewmode-value">${field.value?html}</span>
    </div>
  <#else>
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
       var contentField = Smalgyax.forms.helpers.findInput(form, "cm_content");
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
     
    </script>
    <label for="${fieldHtmlId}">
      File to Be Uploaded:<#if field.mandatory><span class="mandatory-indicator">*</span></#if>
    </label>
    <input id="${fieldHtmlId}" type="file" name="${field.name}"  
           <#if field.disabled>disabled="true"</#if> />
  </#if>
</div>