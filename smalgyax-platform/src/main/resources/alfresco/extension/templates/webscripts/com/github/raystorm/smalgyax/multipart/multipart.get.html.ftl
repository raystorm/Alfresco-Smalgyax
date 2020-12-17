<html>
  <body>
    <form action="${url.service}" method="post" enctype="multipart/form-data">
      File: <input type="file" name="file"><br>
      Title: <input name="title"><br>
      Description: <input name="description"><br>
      <!-- TODO: Add other Fields Here. -->
      <input name="nodeType" type="hidden" value="smd:Template">
      English-Topic  <input name="smd:English-Topic"><br>
      Smalgyax-Topic <input name="smd:Smalgyax-Topic"><br> 
      <input type="submit" name="submit" value="Upload">
    </form>
  </body>
</html>