<?php

namespace common\models\mongodb;

use yii\mongodb\ActiveRecord;

/**
 * Class Order 订单
 * @property string $no
 * @property integer $customerId
 * @property string $medicineIds
 * @property integer $amount
 * @property double $totalPrice
 * @property integer $addressId
 * @property integer $payType
 * @property integer $payStatus
 * @property integer $orderStatus
 * @property integer $status
 * @property integer $createDate
 * @property integer $updateDate
 */
class Order extends ActiveRecord{

    const STATUS_ENABLE = 1;
    const STATUS_DELETE = 0;
    const ORDER_NO_LENGTH = 20;
    const PAY_STATUS_DEFAULT = 0;   //支付状态  未支付
    const PAY_STATUS_SUCCESS = 1;   //支付状态  支付成功
    const PAY_STATUS_FAIL = 2;      //支付状态  支付失败
    const ORDER_STATUS_DEFAULT = 0; //订单状态  进行中
    const ORDER_STATUS_SUEECSS = 1; //订单状态  成功
    const ORDER_STATUS_FAIL = 2;    //订单状态  失败
    const PAY_TYPE_ALIPAY = 1;     //支付类型  支付宝
    const PAY_TYPE_WECHAT = 2;     //支付类型  微信

    public static function collectionName(){
        return 'order';
    }

    public function rules(){
        return [
            [['no', 'customerId', 'medicineIds','amount', 'totalPrice', 'addressId', 'addressId', 'payType'], 'required'],
            [['no'], 'string', 'length'=>self::ORDER_NO_LENGTH],
            [['no'], 'unique'],
            [['customerId','amount', 'addressId', 'payType'], 'integer'],
            [['totalPrice'], 'double'],
            [['payStatus'], 'filter', 'filter'=>function($value){
                return in_array($value, [self::PAY_STATUS_DEFAULT, self::PAY_STATUS_SUCCESS, self::PAY_STATUS_FAIL]) ? $value : self::PAY_STATUS_DEFAULT;
            }],
            [['orderStatus'], 'filter', 'filter'=>function($value){
                return in_array($value, [self::ORDER_STATUS_DEFAULT, self::ORDER_STATUS_SUEECSS, self::ORDER_STATUS_FAIL]) ? $value : self::ORDER_STATUS_DEFAULT;
            }],
            [['status'], 'filter', 'filter'=>function($value){
                return in_array($value, [self::STATUS_ENABLE, self::STATUS_DELETE]) ? $value : self::STATUS_ENABLE;
            }],
            [['payStatus'], 'default' ,'value'=>self::PAY_STATUS_DEFAULT],
            [['orderStatus'], 'default' ,'value'=>self::ORDER_STATUS_DEFAULT],
            [['status'], 'default' ,'value'=>self::STATUS_ENABLE],
            [['createDate','updateDate'], 'default', 'value'=>time()],
        ];
    }

    public function attributes(){
        return [
            '_id',
            'no',
            'customerId',
            'medicineIds',
            'amount',
            'totalPrice',
            'addressId',
            'payType',
            'payStatus',
            'orderStatus',
            'status',
            'createDate',
            'updateDate'
        ];
    }

    public function attributeLabels(){
        return [
            '_id' => 'ID',
            'no' => '订单号',
            'customerId' => '用户ID',
            'medicineIds' => '药品IDS',
            'amount' => '数量',
            'totalPrice' => '总价格',
            'addressId' => '收货地址ID',
            'payType' => '支付类型',
            'payStatus' => '支付状态',
            'orderStatus' => '订单状态',
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
        $where = array('status'=>self::STATUS_ENABLE);
        return $where;
    }

    public function getOnesByNo($no){
        return $this->findOne(['no'=>$no,'status'=>self::STATUS_ENABLE]);
    }

    public function updateByNo($no, $param){
        if(isset($param['no'])){
            unset($param['no']);
        }
        if(empty($no) || empty($param)){
            return 0;
        }
        $model = $this->findOne(['no'=>$no,'status'=>self::STATUS_ENABLE]);
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

    public function deleteByNo($no){
        if(empty($no)){
            return 0;
        }
        $model = $this->findOne(['no'=>$no,'status'=>self::STATUS_ENABLE]);
        if(empty($model)){
            return -1;
        }
        return $model->delete();
    }
}