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
   
   //Display modal processing indicator and disable button
   //var submitButton = Smalgyax.forms.helpers.findInput("submit");
   var submitButton = document.getElementById("default-form-submit-button");   
   submitButton.disabled = true; //disable button
   $("#ProcessingImage").show(); //Show loading indicator
   
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
         case 'text':
         case 'hidden':
         case 'textarea':
           documentData.append(tmpField.name, tmpField.value);
           break;
         default:
           //either, button, submit, or unknown, so ignore
      }
   }

   //URL for Custom Alfresco Update Service to injest Amwaal documents
   var url = Alfresco.constants.PROXY_URI + "hayts";
   
   //TODO: remove after debug
   //alert("about to AJAX send file w/: " + JSON.stringify(documentData));

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
          { 
            //var parsed = $.parseHTML(response);
            //var msg = parsed
            //var msg = $("#message").html(response); 
            //var msg = $(response).find("#message").text()
            //there has to be a more robust way to do this
            var msg = $(response)[3].innerText.trim();
            alert( "Document uploaded successfully. \n" 
                 + msg + "\n");
                 //+ response);
            
            //TODO: hide processing indicator && Re-enable form
            var createForm = Smalgyax.forms.helpers.findCreationForm();
            createForm.reset.click(); //clear the form for the next file
          },
          //TODO: update to offer error reporting after BUILD/DEV Debug
          error: function (response, status, errorMsg)
          { 
             //TODO: get error message from Response Text
             $("#form-messages").replaceWith($(response.responseText.trim()));
             var dialog = $("form-messages").dialog({
                modal: true,
                autoOpen: true,
                buttons: [
                   {
                     text: "Ok",
                     click: function() { $( this ).dialog( "close" ); }
                   }]                   
              });
             
             alert( "Document failed to Upload! \n" 
                  + JSON.stringify(response) + "\n"
                  + errorMsg ); 
          },
          //run after success: or failure: 
          complete: function() 
          {  // enable the button and hide the indicator
             submitButton.disabled = false; 
             $("#ProcessingImage").hide();
          }
      }
   );
   
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
