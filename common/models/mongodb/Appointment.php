<?php

namespace common\models\mongodb;

use yii\helpers\Html;
use yii\mongodb\ActiveRecord;

/**
 * Class Appointment 预约挂号
 * @property string $title
 * @property integer $appointmentId
 * @property integer $customerId
 * @property integer $doctorId
 * @property integer $mdeicalId
 * @property string $serverDate
 * @property double $price
 * @property integer $addressId
 * @property integer $type
 * @property integer $appointmentStatus
 * @property integer $status
 * @property integer $createDate
 * @property integer $updateDate
 */
class Appointment extends ActiveRecord{

    const STATUS_ARRAY = [0,1];  //0=>删除 1=>启用
    const TITLE_MAX_LENGTH = 20;
    const APPOINTMENT_STATUS = [0,1,2]; // 预约状态  0=>预约中 1=>等待上门  2=>已看诊
    const SERVER_TYPE = [1,2,3]; //服务类型 1=>上门 2=>挂号 0=>咨询
    const DOCTOR_DEFAULT = 0;

    public static function collectionName(){
        return 'appointment';
    }

    public function rules(){
        return [
            [['title','appointmentId','customerId','mdeicalId','serverDate','price','addressId','type'], 'required'],
            [['title','serverDate'], 'string', 'max'=>self::TITLE_MAX_LENGTH],
            [['title'], 'filter', 'filter'=>function($value){
                return Html::encode($value);
            }],
            [['appointmentId','customerId','mdeicalId','doctorId','appointmentStatus','addressId','type','status','createDate','updateDate'], 'integer'],
            [['doctorId'], 'default', 'value'=>self::DOCTOR_DEFAULT],
            [['price'],'double'],
            [['appointmentStatus'], 'default', 'value'=>self::APPOINTMENT_STATUS[0]],
            [['appointmentStatus'], 'filter', 'filter'=>function($value){
                return in_array($value, self::APPOINTMENT_STATUS) ? $value : self::APPOINTMENT_STATUS[0];
            }],
            [['type'], 'filter', 'filter'=>function($value){
                return in_array($value, self::SERVER_TYPE) ? $value : self::SERVER_TYPE[0];
            }],
            [['status'],'filter','filter' => function($value){
                return in_array($value, self::STATUS_ARRAY) ? $value : self::STATUS_ARRAY[1];
            }],
            [['status'],'default', 'value' => self::STATUS_ARRAY[1]],
            [['createDate','updateDate'], 'default', 'value'=>time()],
            [['appointmentId','customerId','mdeicalId','doctorId','appointmentStatus','addressId','type','status','createDate','updateDate'], 'filter', 'filter'=>function($value){
                return intval($value);
            }]

        ];
    }

    public function attributes(){
        return [
            '_id',
            'title',
            'appointmentId',
            'customerId',
            'doctorId',
            'mdeicalId',
            'serverDate',
            'price',
            'appointmentStatus',
            'addressId',
            'type',
            'status',
            'createDate',
            'updateDate'
        ];
    }

    public function attributeLabels(){
        return [
            '_id' =>'ID',
            'title' =>'标题',
            'appointmentId' =>'预约人ID',
            'customerId' =>'受诊人ID',
            'doctorId' =>'医生ID',
            'mdeicalId' =>'病例ID',
            'serverDate' =>'服务时间',
            'price' =>'价格',
            'appointmentStatus' => '预约状态',
            'addressId' =>'地址ID',
            'type' => '类型',
            'status' =>'状态',
            'createDate' =>'创建时间',
            'updateDate' =>'更新时间'
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