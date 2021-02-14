<html>
  <body>
    <form action="${url.service}" method="post" 
          enctype="multipart/form-data">
      <!--      
        <show id="cm:name"/>
        <show id="cm:content"     force="true" />
        <show id="cm:title"       force="true"/>
        <show id="cm:description" force="true"/>
        <show id="mimetype"/>
        <show id="app:editInline" force="true"/>

        <show id="smd:nahawt-bc" force="true"/>
        <show id="smd:magon-bc"  force="true"/>
        
        <show id="smd:nahawt-ak" force="true"/>
        <show id="smd:magon-ak"  force="true"/>
      -->
      File: <input type="file" name="file"><br>
      <!-- name is set in the back-end from the file name  -->      
      Title: <input name="title"><br>
      Description: <input name="description"><br>
      <!-- mimetype is calculated in the back-end from the file -->
      <!-- TODO: Add other Fields Here. -->
      <input name="nodeType" type="hidden" value="smd:amwaal">
      <p>
      <strong>BC Orthography</strong><br>
      Nahawt (Title/Topic) <input name="smd:nahawt-bc"><br> 
      Magon  (Description) <input name="smd:magon-bc"><br> 
      </p>
      <p>
      <strong>AK Orthography</strong><br>
      Nahawt (Title/Topic) <input name="smd:nahawt-ak"><br> 
      Magon  (Description) <input name="smd:magon-ak"><br> 
      </p>
      <input type="submit" name="submit" value="Upload">      
    </form>
  </body>
</html>