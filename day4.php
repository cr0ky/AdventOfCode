<?php

$input="yzbqklnj";
$length=strlen($input);

for ( $i=1; $i<pow(10,$length); $i++ ){
        if( substr(md5("$input$i"),0,6) === "000000"){
                echo "$i\n";
                die();
        }
}

?>
