//alert("Smalgyax JS loading.");

//import { jQuery } from '/share/res/js/lib/jquery-1.11.1/jquery-1.11.1.min.js';

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
      if ( "form" === form.id ) { return form; }
   }
};
 
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
};
 
/** 
 * Helper function to find the needed input element on the form
 * @param form {HTMLFormElement} The forms runtime class instance the field is being managed by
 * @param inputName {String} part of the name element of the needed input element
 */
Smalgyax.forms.helpers.findFileField = function findFileField(form)
{
   "use strict";
   
   var i = 0;
   //find cm:name
   for (i = 0; i < form.elements.length; ++i) 
   { if (form.elements[i].type == "file" ) { return form.elements[i]; } }
};

/**
 *  function to submit the form    
 */
Smalgyax.forms.event.onClickEvent = function onClickEvent(event) 
{
   "use strict";   
   
   //TODO: Display modal processing indicator
   
   var documentData = new FormData();
   //documentData.append('file', 
   //                    $('input#file.findDocumentOnboarding')[0].files[0]);

   var createForm = Smalgyax.forms.helpers.findCreationForm();

   var i = 0;
   var tmpField;
   //find cm:name
   for (i = 0; i < form.elements.length; ++i)
   {
      tmpField = form.elements[i];
      switch(tmpField.type)
      {
         case 'file':
           documentData.append(tmpField.name, tmpField.files[0]);
           break;
         case 'file':
           documentData.append(tmpField.name, tmpField,value);
           break;
         default:
           //either, button, submit, or unknown, so ignore
      }
   }

   //http://localhost:8080/alfresco/api/-default-/public/alfresco/versions/1/nodes/-root-/children
   //URL for Alfresco Update Service
   //var url = Alfresco.constants.PROXY_URI + "api/upload";
   //var url = Alfresco.constants.PROXY_URI + "api/-default-/public/alfresco/versions/1/nodes/-root-/children";
   var url = Alfresco.constants.PROXY_URI + "hayts"

   //https://api.jquery.com/Jquery.ajax/Works
   $.ajax({
          url: url,
          type: 'POST',
          data: documentData,
          cache: false,
          enctype: 'multipart/form-data',
          contentType: false,
          //contentType: 'multipart/form-data',
          processData: false,
          success: function (response) 
          { alert("Document uploaded successfully. " + response); }
          //function to run after success: or failure: 
          //complete: function() { }
          //TODO: update to offer error reporting after BUILD/DEV Debug
          error: function (response)
          { alert("Document failed to Upload! \n" + response); }
      }
   );
   
   //TODO: hide processing indicator
   
   return false;
}

/** Add the Event Handler to the File Control */
Smalgyax.forms.prepare.addEventHandler = function addEventHandler()
{
   "use strict";
   
   var form = Smalgyax.forms.helpers.findCreationForm();
   //var contentField = Smalgyax.forms.helpers.findInput(form, "cm_content");
   //var contentField = Smalgyax.forms.helpers.findInput(form, "files[]");
   var button = Smalgyax.forms.helpers.findInput(form, "submit");
   button.onclick = Smalgyax.forms.event.onClickEvent;
}

//TODO: replace with DOM manipulation
//alert("Smalgyax JS loaded.");
