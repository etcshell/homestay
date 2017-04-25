<?php

namespace common\models\mongodb;

use yii\helpers\Html;
use yii\mongodb\ActiveRecord;

/**
 * Class Order 病例记录
 * @property string $title
 * @property string $describes
 * @property integer $appointmentId
 * @property integer $customerId
 * @property integer $addressId
 * @property integer $doctorId
 * @property integer $mdeicalId
 * @property string $medicineIds
 * @property double $price
 * @property integer $type
 * @property integer $status
 * @property integer $createDate
 * @property integer $updateDate
 */
class Medicalrecord extends ActiveRecord{

    const STATUS_ARRAY = [0,1];  //0=>删除 1=>启用
    const TITLE_MAX_LENGTH = 20;
    const DASCRIBES_MAX_LENGTH = 100;
    const SERVER_TYPE = [1,2,3]; // 1=>上门 2=>挂号 0=>咨询

    public static function collectionName(){
        return 'customer_medical_record';
    }

    public function rules(){
        return [
            [['title','describes','appointmentId','customerId','addressId','doctorId','mdeicalId','medicineIds','price','type'], 'required'],
            [['title'], 'string', 'max'=>self::TITLE_MAX_LENGTH],
            [['describes'] , 'string', 'max'=>self::DASCRIBES_MAX_LENGTH],
            [['title','describes'], 'filter', 'filter'=>function($value){
                return Html::encode($value);
            }],
            [['appointmentId','customerId','addressId','doctorId','mdeicalId','type','status','createDate','updateDate'], 'integer'],
            [['price'],'double'],
            [['medicineIds'], 'string'],
            [['type'], 'filter', 'filter'=>function($value){
                return in_array($value, self::SERVER_TYPE) ? $value : self::SERVER_TYPE[0];
            }],
            [['status'],'filter','filter' => function($value){
                return in_array($value, self::STATUS_ARRAY) ? $value : self::STATUS_ARRAY[1];
            }],
            [['status'],'default', 'value' => self::STATUS_ARRAY[1]],
            [['createDate','updateDate'], 'default', 'value'=>time()],
            [['appointmentId','customerId','addressId','doctorId','mdeicalId','type','status','createDate','updateDate'], 'filter', 'filter'=>function($value){
                return intval($value);
            }],
        ];
    }

    public function attributes(){
        return [
            '_id',
            'title',
            'describes',
            'appointmentId',
            'customerId',
            'addressId',
            'doctorId',
            'mdeicalId',
            'medicineIds',
            'price',
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
            'describes' => '描述',
            'appointmentId' => '预约人ID',
            'customerId' =>'受诊人ID',
            'addressId' => '地址ID',
            'doctorId' =>'医生ID',
            'mdeicalId' =>'病例ID',
            'medicineIds' =>'药品IDS',
            'price' =>'价格',
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