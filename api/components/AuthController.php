<?php
namespace api\components;

use Yii;
use yii\filters\Cors;
use yii\rest\ActiveController;
use yii\helpers\ArrayHelper;
use yii\filters\auth\CompositeAuth;
use yii\filters\auth\HttpBasicAuth;
use yii\filters\auth\QueryParamAuth;
use yii\filters\auth\HttpBearerAuth;

class AuthController extends ActiveController
{

  public $serializer = [
      'class' => 'yii\rest\Serializer',
      'collectionEnvelope' => 'items'
  ];

  public function behaviors()
  {
      return ArrayHelper::merge(parent::behaviors(), [
        'authenticator' => [
          'class' => CompositeAuth::className(),
          'authMethods' => [
            HttpBearerAuth::className(),
            HttpBasicAuth::className(),
            QueryParamAuth::className(),
          ]
        ],
        'rateLimiter'=>[
          'enableRateLimitHeaders' => true
        ],
        [
           'class' => Cors::className(),
               'cors' => [
                  'Origin' => ['*'],
                  'Access-Control-Request-Method' => ['GET','POST','PUT','DELETE', 'HEAD', 'OPTIONS'],//允许动作的数组
                ]
        ]
      ]);
  }

  public function actions()
  {
      $actions = parent::actions();
      unset($actions['index'], $actions['update'], $actions['create'], $actions['delete'], $actions['view']);
      return $actions;
  }

  protected function verbs()
  {
      return [
          'index' => ['GET', 'HEAD'],
          'view' => ['GET', 'HEAD'],
          'create' => ['POST'],
          'update' => ['POST','PUT', 'PATCH'],
          'delete' => ['POST','DELETE'],
      ];
  }

  public function output($data=null,$status=1,$msg='success')
  {
    return [
      'status' => $status,
      'msg' => $msg,
      'data' => $data
    ];
  }
}
