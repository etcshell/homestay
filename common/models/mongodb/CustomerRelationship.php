<?php

namespace common\models\mongodb;

use yii\mongodb\ActiveRecord;

/**
 * Customerrelation  用户关系表
 * @property integer $sendCustomerId
 * @property integer $receiveCustomerId
 * @property integer $type
 * @property integer $isAgree
 * @property integer $status
 * @property integer $createDate
 * @property integer $updateDate
 */
class CustomerRelationship extends ActiveRecord {

    const STATUS_ARRAY = [0,1];  //0=>删除 1=>启用
    const TYPE = [1,2]; //1=>好友 2=>从属
    const ISAGREE = [0,1,2]; // 0=> 申请中 1=>同意  2=>拒绝

    public static function collectionName(){
        return 'customer_relationship';
    }

    public function rules(){
        return [
            [['sendCustomerId','receiveCustomerId','type'], 'required'],
            [['sendCustomerId','receiveCustomerId','type','isAgree','status','createDate','updateDate'], 'integer'],
            [['type'],'filter','filter' => function($value){
                return in_array($value, self::TYPE) ? $value : self::TYPE[0];
            }],
            [['isAgree'],'filter','filter' => function($value){
                return in_array($value, self::ISAGREE) ? $value : self::ISAGREE[0];
            }],
            [['isAgree'] , 'default', 'value'=> self::ISAGREE[0]],
            [['status'],'filter','filter' => function($value){
                return in_array($value, self::STATUS_ARRAY) ? $value : self::STATUS_ARRAY[1];
            }],
            [['status'],'default', 'value' => self::STATUS_ARRAY[1]],
            [['createDate', 'updateDate'],'default', 'value'=> time()],
            [['sendCustomerId','receiveCustomerId','type','isAgree','status','createDate','updateDate'], 'filter', 'filter'=>function($value){
                return intval($value);
            }],
        ];
    }

    public function attributes(){
        return [
            '_id',
            'sendCustomerId',
            'receiveCustomerId',
            'type',
            'isAgree',
            'status',
            'createDate',
            'updateDate'
        ];
    }

    public function attributeLabels(){
        return [
            '_id' => 'ID',
            'sendCustomerId' => '发送人ID',
            'receiveCustomerId' => '接收人ID',
            'type' => '类型',
            'isAgree' => '是否同意',
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
