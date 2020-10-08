<?php
// model
include THE_ROOT . DIRECTORY_SEPARATOR . 'model' . DIRECTORY_SEPARATOR . 'cl.lost-pass.model.php';

if (isset($_POST['email'])) {
    $claimedEmail = $_POST['email'];
//if (true) {
//    $email = $_POST['email'];
    if (filter_var($claimedEmail, FILTER_VALIDATE_EMAIL)) {
//    if (true) {
        $req = "SELECT * FROM user";
        $result = mysqli_query($db, $req);
        $requestIsValid = mysqli_num_rows($result);
        var_dump($requestIsValid);
        if ($requestIsValid) {
            while ($row = mysqli_fetch_assoc($result)) {
                $distantEmail = ($row['mail_user']);
            }
            if ((isset($distantEmail) && ($distantEmail === $claimedEmail))) {
                $infoMessage = 'same email';
            } else {
                $infoMessage = 'different email';
            }
        } else {
            $infoMessage = 'non existing claimed email';
        }

    }
}
include THE_ROOT . DIRECTORY_SEPARATOR . 'view' . DIRECTORY_SEPARATOR . 'user' . DIRECTORY_SEPARATOR . 'lost-pass.view.php';