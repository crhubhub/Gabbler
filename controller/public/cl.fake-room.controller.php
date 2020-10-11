<?php
// Loading the necessary bounded model
include THE_ROOT . DIRECTORY_SEPARATOR . 'model' . DIRECTORY_SEPARATOR . 'cl.banner.model.php';

//Checking if the email to check was setted
if (isset($_POST['email'])) {
    $claimedEmail = $_POST['email'];

//    Checking that the setted email is a 'valid email format' input
    if (filter_var($claimedEmail, FILTER_VALIDATE_EMAIL)) {

//        Sql request
        $req = "SELECT nickname_user, mail_user FROM user";
//        Req exec
        $result = mysqli_query($db, $req);
//        Just checking if the request was correct comparing to the db...
        $requestIsValid = mysqli_num_rows($result);
        if ($requestIsValid) {
//            Parsing and variables creation
            while ($row = mysqli_fetch_assoc($result)) {
                $distantEmail = ($row['mail_user']);
                $distantUser = ($row['nickname_user']);
            }
            if ((isset($distantEmail) && ($distantEmail === $claimedEmail))) {
//                Sending an email which helps the user to reconnect
//                ...and display a message which leaves the whole mystery about the
                echo 'mail is matching'; //toDel
//                TODO :
//  -sendmail()

//  -toast message : ´Thank you for completing your email address, if we recognize it, we will send you an email which will allow you to recover your Gabbler account.´';
            } else {
                echo 'mail is not matching'; //toDel
//              TODO :
//  -toast message : ´Thank you for completing your email address, if we recognize it, we will send you an email which will allow you to recover your Gabbler
// account´';
            }
        } else {
            echo 'debug : sql_req problem';
        }


    }
}
include THE_ROOT . DIRECTORY_SEPARATOR . 'view' . DIRECTORY_SEPARATOR . 'user' . DIRECTORY_SEPARATOR . 'fake-room.view.php';