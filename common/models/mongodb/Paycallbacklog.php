<?php

namespace common\models\mongodb;

use yii\mongodb\ActiveRecord;

/**
 * Paycallbacklog 支付回掉记录
 * @property string $orderNo
 * @property string $payAccount
 * @property integer $payType
 * @property integer $payDate
 * @property integer $payStauts
 * @property string $payMessage
 * @property double $payAmount
 * @property string $body
 * @property integer $status
 * @property integer $createDate
 * @property integer $updateDate
 */
class Paycallbacklog extends ActiveRecord {

    const STATUS_ARRAY = [0,1];  //0=>删除 1=>启用
    const PAY_TYPE = [1,2,3,4];   // 支付类型 1=>支付宝  2=>微信 3=>银联 4=>医保
    const PAY_STATUS = [0,1];   // 支付状态 0=>失败  1=>成功
    const BODY_DEFAULT = '[]';

    public static function collectionName(){
        return 'pay_callback_log';
    }

    public function rules(){
        return [
            [['orderNo','payAccount','payType','payDate','payStauts','payMessage','payAmount'],'required'],
            [['orderNo','payAccount','payMessage','body'],'string'],
            ['orderNo','unique'],
            [['payType','payDate','payStauts','status','createDate','updateDate'],'integer'],
            [['payType'],'filter','filter' => function($value){
                return in_array($value, self::PAY_TYPE) ? $value : self::PAY_TYPE[0];
            }],
            [['payStauts'],'filter','filter' => function($value){
                return in_array($value, self::PAY_STATUS) ? $value : self::PAY_STATUS[0];
            }],
            [['payAmount'],'double'],
            [['status'],'filter','filter' => function($value){
                return in_array($value, self::STATUS_ARRAY) ? $value : self::STATUS_ARRAY[1];
            }],
            [['status'],'default', 'value' => self::STATUS_ARRAY[1]],
            [['createDate', 'updateDate'],'default', 'value'=> time()],
            [['payType','payDate','payStauts','status','createDate','updateDate'],'filter', 'filter'=>function($value){
                return intval($value);
            }],
            [['body'], 'default', 'value'=>self::BODY_DEFAULT]
        ];
    }

    public function attributes(){
        return [
            '_id',
            'orderNo',
            'payAccount',
            'payType',
            'payDate',
            'payStauts',
            'payMessage',
            'payAmount',
            'body',
            'status',
            'createDate',
            'updateDate'
        ];
    }

    public function attributeLabels(){
        return [
            '_id' => 'ID',
            'orderNo' => '订单号',
            'payAccount' => '支付账号',
            'payType' => '支付类型',
            'payDate' => '支付时间',
            'payStauts' => '支付状态',
            'payMessage' => '支付信息',
            'payAmount' => '支付金额',
            'body' => '用户自定义参数',
            'status' => '状态',
            'createDate' => '创建时间',
            'updateDate' => '更新时间'
        ];
    }

    public function getList($param){
        $where = $this->_createWhere($param);
        $list = $this->find()->where($where)->orderBy('createDate desc');
        return $list;
    }

    private function _createWhere($param){
        $where = array('status'=>self::STATUS_ARRAY[1]);
        return $where;
    }

    public function getOnesById($id){
        return $this->findOne(['_id'=>$id,'status'=>self::STATUS_ARRAY[1]]);
    }

    public function updateById($id, $param){
        if(isset($param['id'])){
            unset($param['id']);
        }
        if(empty($id) || empty($param)){
            return 0;
        }
        $model = $this->findOne(['_id'=>$id,'status'=>self::STATUS_ARRAY[1]]);
        if(empty($model)){
            return -1;
        }
        if(!isset($param['updateDate'])){
            $param['updateDate'] = time();
        }
        $model->attributes = $param;
        $model->update();
        return $model;
    }

    public function deleteById($id){
        if(empty($id)){
            return 0;
        }
        $model = $this->findOne(['_id'=>$id,'status'=>self::STATUS_ARRAY[1]]);
        if(empty($model)){
            return -1;
        }
        return $model->delete();
    }

}
