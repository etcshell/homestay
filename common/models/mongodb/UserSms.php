<?php
/**
 * @author: 61558262@qq.com
 */

namespace common\models\mongodb;

use yii;
use yii\helpers\Html;
USE yii\mongodb\ActiveRecord;
use yii\httpclient\Client;

/**
 * @property string toUserId
 * @property int category
 * @property string mobile
 * @property string title
 * @property string content
 * @property string smsProviderResponse
 * @property mixed status
 * @property string fromUserId
 * @property int createDate
 * @property int updateDate
 */
class UserSms extends ActiveRecord
{

    const STATUS_UNREAD = 1;
    const STATUS_READED = 0;
    const STATUS_DELETE = 2;
    const CATEGORY_SYSTEM = 1;
    const CATEGORY_USER = 2;


    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['mobile'], 'required'],
            [['title', 'content'], 'string', 'max' => 200],
            [['title'], 'default', 'value' => function ($model, $attribute) {
                return '系统消息';
            }],
            [['title', 'content'], 'filter', 'filter' => function ($value) {
                return Html::encode($value);
            }],
            [['category', 'status'], 'filter', 'filter' => function ($value) {
                return intval($value);
            }],
            [['status'], 'filter', 'filter' => function ($value) {
                return in_array($value, [self::STATUS_UNREAD, self::STATUS_READED, self::STATUS_DELETE]) ? $value : self::STATUS_UNREAD;
            }],
            [['mobile'], 'verifyMobileNumber'],
            [['createDate'], 'filter', 'filter' => function ($value) {
                if ($value == '') {
                    return time();
                }else{
                    return $value;
                }
            }],
            [['updateDate'], 'filter', 'filter' => function ($value) {
                    return time();
            }],
            [['content','smsProviderResponse'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public static function collectionName()
    {
        return 'user_sms';
    }

    /**
     *  verify mobile number
     */
    public function verifyMobileNumber($attribute, $params)
    {
        if(!preg_match("/1[3458]{1}\d{9}$/",$this->mobile)){
          $this->addError($attribute, "手机号码不正确。");
        }
    }
    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'title' => '标题',
            'mobile' => '手机号',
            'content' => '内容',
            'smsProviderResponse' => '发送返回信息',
            'createDate' => '发布日期',
            'updateDate' => '修改日期',
            'toUserId' => '收件人',
            'fromUserId' => '发件人',
            'category' => '类型',
            'status' => '状态',
        ];
    }

    /**
     *只要是集成mongodb/activerecord的子类都需要实现该方法
     *available attributes
     */
    public function attributes()
    {
        return ['_id', 'mobile','title', 'content', 'smsProviderResponse','createDate', 'updateDate', 'status', 'category', 'toUserId', 'fromUserId'];
    }

    /** This is invoked before the record is saved.
     * @return boolean whether the record should be saved.
     */
    public function beforeSave($insert)
    {
        if(parent::beforeSave($insert))
        {
            if($this->isNewRecord)
            {
              if(empty($this->content))
                $this->content = $this->_generateVerifyCode();
              $data = $this->_sendSms($this->mobile,$this->content);
              $this->smsProviderResponse = $data;
            }
            return true;
        }
        else
            return false;
    }

    private function _contentTemplate($content)
    {
        if (strstr($content, '验证码:')) {
            $content = str_replace(array('%', "'", '验证码:'), '', $content);
            return "您的验证码是：" . $content . "。请不要把验证码泄露给其他人。如非本人操作，可不用理会！";
        } else {
            return $content;
        }
    }

    private function _sendSms($mobile,$content){
      $content = $this->_contentTemplate('验证码:'.$content);
      $data = [
        'account' => Yii::$app->params['sms']['account'],
        'password' => Yii::$app->params['sms']['password'],
        'url' => Yii::$app->params['sms']['url'],
        'mobile'=>$mobile,
        'content'=> $content
      ];
      $client = new Client();
      $response = $client->createRequest()
          ->setMethod('post')
          ->setUrl(Yii::$app->params['sms']['url'])
          ->setData($data)
          ->send();
      return $response->data;
    }

    private  function _generateVerifyCode($length = 4) {
      return rand(pow(10,($length-1)), pow(10,$length)-1);
    }
}
