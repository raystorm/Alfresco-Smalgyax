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

        <show id="smd:nahawtBC" force="true"/>
        <show id="smd:magonBC"  force="true"/>
        
        <show id="smd:nahawtAK" force="true"/>
        <show id="smd:magonAK"  force="true"/>
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
      Nahawt (Title/Topic) <input name="smd:nahawtBC"><br>
      Magon  (Description) <input name="smd:magonBC"><br>
      </p>
      <p>
      <strong>AK Orthography</strong><br>
      Nahawt (Title/Topic) <input name="smd:nahawtAK"><br>
      Magon  (Description) <input name="smd:magonAK"><br>
      </p>
      <input type="submit" name="submit" value="Upload">      
    </form>
  </body>
</html>