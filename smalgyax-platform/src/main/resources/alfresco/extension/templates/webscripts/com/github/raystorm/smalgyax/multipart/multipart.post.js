// extract file attributes
var title = args.title;
var description = args.description;

// extract file
var file = null;
var type = null;
var firstFound = false;
for each (field in formdata.fields)
{
   if ( field.name == "file" && field.isFile ) 
   {
      file = field;
      if ( firstFound ) { break; }
      firstFound = true;
   }
   if ( "nodeType" == field.name )
   {
      type = field.value;
      if ( firstFound ) { break; }
      firstFound = true; 
   }
}

// ensure file has been uploaded
if (file.filename == "")
{
   status.code = 400;
   status.message = "Uploaded file cannot be located";
   status.redirect = true;
}
else
{
   // create document in company home from uploaded file
   upload = companyhome.createFile(file.filename, type);
   upload.properties.content.guessMimetype(file.filename);
   upload.properties.content.write(file.content);
   upload.properties.title = title;
   upload.properties.description = description;
   
   //upload.properties.nodeType = "smd:Template";
   //upload.nodeType = "smd:Template";
   
   //Add other Fields
   for each (field in formdata.fields)
   {
      if ( field.name == "file" 
        || field.name == "title" 
        || field.name == "description"
        || field.name == "nodeType" ) 
      { continue; } //skip special fields
      
      upload.properties[field.name] = field.value;
   }
   
   upload.save();
   // setup model for response template
   model.upload = upload;
}
