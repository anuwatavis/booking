<?php

/* settings/database.php */

return array(
    'mysql' => array(
        'dbdriver' => 'mysql',
        'username' => 'root',
        'password' => '',
        'dbname' => 'booking',
        'prefix' => 'book',
    ),
    'tables' => array(
        'user' => 'user',
        'language' => 'language',
        'category' => 'category',
        'reservation' => 'reservation',
        'rooms' => 'rooms',
        'reservation_data' => 'reservation_data',
        'rooms_meta' => 'rooms_meta',
    ),
);
