<?php
return [
    'id' => 'app-common-tests',
    'basePath' => dirname(__DIR__),
    'components' => [
      'db' => [
          'class' => 'yii\db\Connection',
          'dsn' => 'mysql:host=127.0.0.1;dbname=bltszy_test',
          'username' => 'root',
          'password' => '',
          'charset' => 'utf8',
      ],
      'mongodb' => [
          'class' => '\yii\mongodb\Connection',
          'dsn' => 'mongodb://bltszy:bltszy@121.40.180.111:27017/bltszy_test',
      ],
      'mailer' => [
          'class' => 'yii\swiftmailer\Mailer',
          'viewPath' => '@common/mail',
          'useFileTransport' => true,
      ],
    ],
];
