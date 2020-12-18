// extract file attributes
var title = args.title;
var description = args.description;

// extract file
var file = null;
var type = "smd:amwaal";
var firstFound = false;
var destination;
for each (field in formdata.fields)
{
   if ( field.name == "file" && field.isFile ) 
   {
      file = field;
      break;
   }
   if ( field.name == "alf_destination" ) { destination = field.value; }
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
   // create document in destination or company home, for uploaded file
   let folder;
   if ( destination )
   { folder = utils.getNodeFromString(destination) }
   else { folder = companyhome; }
   
   upload = folder.createFile(file.filename, type);
   upload.properties.content.guessMimetype(file.filename);
   upload.properties.content.write(file.content);
   upload.properties.title = title;
   upload.properties.description = description;
   
   //upload.properties.nodeType = "smd:amwaal";
   //upload.nodeType = "smd:amwaal";
   
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
