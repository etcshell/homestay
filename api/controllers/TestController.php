<?php

namespace api\controllers;

use Yii;
use api\components\BaseController;
use yii\helpers\Url;
use yii\mongodb\Query;
use yii\web\Controller;
use yii\data\ActiveDataProvider;
use common\models\mongodb\Customer;
use common\models\mongodb\ExternalApiUser;
use yii\httpclient\Client;
use common\models\job\DownloadJob;

class TestController extends BaseController
{
  private function _newContent($content)
  {
      if (strstr($content, '验证码:')) {
          $content = str_replace(array('%', "'", '验证码:'), '', $content);
          return "您的验证码是：" . $content . "。请不要把验证码泄露给其他人。如非本人操作，可不用理会！";
      } else {
          return $content;
      }
  }
  public function actionIndex()
  {
    //an example of redis cache 
    Yii::$app->redis->set('x','y');
    $x = Yii::$app->redis->get('x');
    //an example of queue
    Yii::$app->queue->push(new DownloadJob([
    'url' => 'http://c2.biketo.com/d/file/racing/internal/2017-04-09/cbbdd592e13135244dffeec60a66204b.jpg',
    'file' => '/Users/cailihua/Projects/bltszy/common/models/job/image.jpg',
]));
    die();
$c=$this->_newContent('验证码:2367');
$data2 = [
  'account' => 'cf_xqwl',
  'password' => 'wa2Dmu',
  'url' => "http://106.ihuyi.cn/webservice/sms.php?method=Submit",
  'mobile'=>'15900622307',
  'content'=>$c
];
$data = [
  'account' => Yii::$app->params['sms']['account'],
  'password' => Yii::$app->params['sms']['password'],
  'url' => Yii::$app->params['sms']['url'],
  'mobile'=>'15900622307',
  'content'=> $c
];
$client = new Client();
$response = $client->createRequest()
    ->setMethod('post')
    ->setUrl(Yii::$app->params['sms']['url'])
    ->setData($data)
    ->send();
    print_r($response);die();
if ($response->isOk) {
    $newUserId = $response->data['id'];
}
    die();
    $customer = new ExternalApiUser();
    $customer->userName = 'puppy dog';
    $customer->status = 1;
    $y= [
      "apiKey" =>'fgjkdc67f31da20e5e3b35b3',
      "publicKey" => "publickey-123",
      "secreteKey" =>"secreteKey-123" // 用来对sign进行签名
    ];
    $customer->apiKeyInfos=$y;
    $customer->save();
    echo $customer->_id;
//die();
    $x=$customer->createAuthkey((string)$customer->_id);

  $y= [
    "apiKey" =>$x,
    "publicKey" => "publickey-123",
    "secreteKey" =>"secreteKey-256" // 用来对sign进行签名
];
echo $x;
$customer->apiKeyInfos=$y;
$customer->save();
//$customer->update(['apiKeyInfos'=>$y]);
  }
  public function actionList()
  {
      $query = new Query ();
      $query->select ( [
      'name',
      'status'
      ] )->from ( 'customer' )->offset ( 10 )->limit ( 10 );
      $rows = $query->all ();
      var_dump ( $rows );
  }
  public function x()
  {
      $query = new Query ();
      $row = $query->from ( 'customer' )->one ();
      echo Url::toRoute ( [
      'item/update',
      'id' => ( string ) $row ['_id']
      ] );
      var_dump ( $row ['_id'] );
      var_dump ( ( string ) $row ['_id'] );
  }
  public function actionFind()
  {
      $provider = new ActiveDataProvider ( [
      'query' => Customer::find (),
      'pagination' => [
      'pageSize' => 10
      ]
      ] );
      $models = $provider->getModels ();
      var_dump ( $models );
  }
  public function actionQuery()
  {
      $query = new Query ();
      $query->from ( 'customer' )->where ( [
      'status' => 2
      ] );
      $provider = new ActiveDataProvider ( [
      'query' => $query,
      'pagination' => [
      'pageSize' => 10
      ]
      ] );
      $models = $provider->getModels ();
      var_dump ( $models );
  }
  public function actionSave()
  {
      $res = Customer::saveInfo ();
      var_dump ( $res );
  }
}
