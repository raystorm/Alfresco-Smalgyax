//if (Smalgyax === undefined || !Smalgyax) { var Smalgyax = {}; }
if (Smalgyax === undefined || typeof Smalgyax == "undefined" || !Smalgyax) { 
    var Smalgyax = {};
}

/**
 *  finds the create form and sets the cm:name field to read only
 */
//Smalgyax.forms.prepare.setNameReadonly = 
function setNameReadOnly() {
    "use strict";
    //find the creation form
    //for ( let form of document.forms )
    var fi = 0;
    var form = null;
    var ii = 0;
    var input;
    for (fi = 0; fi < document.forms.length; ++fi) {
        form = document.forms[fi];
        if (form.id.includes("create-content")) {
            //find cm:name
            //for (let input of form.elements)
            for (ii = 0; ii < form.elements.length; ++ii) {
                input = form.elements[ii];
                if (input.name.includes("cm_name")) {
                    input.readOnly = true;
                    input.placeholder = "Field will match the FileName";
                    return;
                }
            }
        }
    }
}

Smalgyax.forms.prepare.setNameReadonly();


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
//Smalgyax.forms.validation.setNameValue = 
function setNameValue(field, args, event, form, silent, message) {
    "use strict";
    //getName field
    //var form = field.form;

    var nameField = null;
    var ii = 0;
    var input;
    for (ii = 0; ii < form.elements.length; ++ii) {
        input = form.elements[ii];
        if (input.name.includes("cm_name")) {
            nameField = input;
            break;
        }
    }

    if (nameField) {
        nameField.value = field.files[0].name;
        return true;
    }

    message = "Cannot add a file when one has not been provided.";
    return false;
}
