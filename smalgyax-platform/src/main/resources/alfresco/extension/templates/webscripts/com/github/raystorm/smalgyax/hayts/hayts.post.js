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
   var folder;
   if ( destination ) { folder = utils.getNodeFromString(destination); }
   else { folder = companyhome; }
   
   upload = folder.createFile(file.filename, type);
   upload.properties.content.guessMimetype(file.filename);
   upload.properties.content.write(file.content);
   upload.properties.title = title;
   upload.properties.description = description;
   upload.properties.author = person.name;
   //special processing for company home?
   //upload.properties.folder = destination.name
   upload.properties.folder = destination.properties.name
   //upload.properties.folder = destination.getDisplayPath();
   //upload.properties.folder = destination.displayPath;
   
   //poor mans human reasable size
   var unit = [ "bytes", "kb", "mb", "gb", "tb" ];
   var friendlySize = upload.properties.content.size;
   var i = 0;
   for (i=0; i < unit.length; ++i )
   {
      if ( friendlySize < 1024 ) { break; }
      friendlySize = friendlySize / 1024;
   }

   upload.properties.humanSize = friendlySize;
   upload.properties.sizeUnit =  unit[i];
   
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
