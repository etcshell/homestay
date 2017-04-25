<?php
return [
    'vendorPath' => dirname(dirname(__DIR__)) . '/vendor',
    'components' => [
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
        'db' => [
            'class' => 'yii\db\Connection',
            'dsn' => 'mysql:host=127.0.0.1;dbname=bltszy',
            'username' => 'root',
            'password' => '',
            'charset' => 'utf8',
        ],
        'mongodb' => [
            'class' => '\yii\mongodb\Connection',
        //    'dsn' => 'mongodb://piper:111111@localhost:27016/piper,localhost:27017/piper,localhost:27018/piper?replicaSet=etcshell',
            'dsn' => 'mongodb://bltszy:111111@127.0.0.1:27017/bltszy',
        ],
        'redis' => [
            'class' => 'yii\redis\Connection',
            'hostname' => 'localhost',
            'port' => 6379,
            'database' => 0,
        ],
        'jwt' => [
            'class' => 'sizeg\jwt\Jwt',
            'key' => 'IfyouwantolawitJWT',
        ],
        'smser' => [
            'class' => 'daixianceng\smser\SxtSmser',
            'url' => 'http://106.ihuyi.cn/webservice/sms.php?method=Submit',
            'username' => 'cf_xqwl',
            'password' => 'wa2Dmu',
            'fileMode' => false
        ],
        'queue2' => [
            'class' => \zhuravljov\yii\queue\redis\Queue::class,
          //  'as log' => \zhuravljov\yii\queue\LogBehavior::class,
            'redis' => 'redis', // connection ID
            'channel' => 'queue', // queue channel
        ],
        'queue' => [
            'class' => \zhuravljov\yii\queue\amqp\Queue::class,
            'host' => '121.40.180.111',
            'port' => 5672,
            'user' => 'root',
            'password' => 'root',
            'queueName' => 'queue2',
        ],
    ],
];
