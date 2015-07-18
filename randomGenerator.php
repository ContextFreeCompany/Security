<?php
    // $size = mcrypt_get_iv_size(MCRYPT_CAST_256, MCRYPT_MODE_CFB);
    // $iv = mcrypt_create_iv($size, MCRYPT_DEV_RANDOM);

    $salt = mcrypt_create_iv(22, MCRYPT_DEV_URANDOM);
    $salt = base64_encode($salt);
    $salt = str_replace('+', '.', $salt);
    $hash = crypt('rasmuslerdorf', '$2y$10$'.$salt.'$');

    echo $hash;

?>

?>
