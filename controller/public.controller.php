<?php
/*
 * Public Controller
 */

if (!isset($_GET['p'])) {

    include THE_ROOT . DIRECTORY_SEPARATOR . 'controller' . DIRECTORY_SEPARATOR . 'public' . DIRECTORY_SEPARATOR . 'home.user.controller.php';

} else {

    switch ($_GET['p']) {

        case 'profil.user':
            include THE_ROOT . DIRECTORY_SEPARATOR . 'view' . DIRECTORY_SEPARATOR . 'user' . DIRECTORY_SEPARATOR . 'profil.user.view.php';
            break;
        case 'room.user':
            include THE_ROOT . DIRECTORY_SEPARATOR . 'view' . DIRECTORY_SEPARATOR . 'user' . DIRECTORY_SEPARATOR . 'room.user.view.php';
            break;
        case 'history.user':
            include THE_ROOT . DIRECTORY_SEPARATOR . 'view' . DIRECTORY_SEPARATOR . 'user' . DIRECTORY_SEPARATOR . 'history.user.view.php';
            break;
        case 'contact.user':
            include THE_ROOT . DIRECTORY_SEPARATOR . 'view' . DIRECTORY_SEPARATOR . 'user' . DIRECTORY_SEPARATOR . 'contact.user.view.php';
            break;
        case 'lost-pass.user':
            include THE_ROOT . DIRECTORY_SEPARATOR . 'controller' . DIRECTORY_SEPARATOR . 'public' . DIRECTORY_SEPARATOR . 'cl.lost-pass.controller.php';
            break;
        case 'home.admin':
            include THE_ROOT . DIRECTORY_SEPARATOR . 'view' . DIRECTORY_SEPARATOR . 'admin' . DIRECTORY_SEPARATOR . 'home.admin.view.php';
            break;

        default :
            include THE_ROOT . DIRECTORY_SEPARATOR . 'view' . DIRECTORY_SEPARATOR . '404.view.php';

    }
}

$content = ob_get_clean();

// view
require_once THE_ROOT . DIRECTORY_SEPARATOR . 'public' . DIRECTORY_SEPARATOR . 'template' . DIRECTORY_SEPARATOR . 'default.php';