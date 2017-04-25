<?php

namespace common\models\mongodb;

use yii\mongodb\ActiveRecord;

/**
 * Class Store 门店
 * @property string $name
 * @property string $describes
 * @property string $address
 * @property string $telephone
 * @property integer $status
 * @property integer $createDate
 * @property integer $updateDate
 */
class Store extends ActiveRecord{

    const NAME_MAX_LENGHT = 20;
    const STATUS_ARRAY = [0,1];  //0=>删除 1=>启用

    public static function collectionName(){
        return 'store';
    }

    public function rules(){
        return [
            [['name', 'address', 'telephone'], 'required'],
            [['name'], 'string', 'max'=>self::NAME_MAX_LENGHT],
            [['name'],'unique'],
            [['status'],'filter','filter' => function($value){
                return in_array($value, self::STATUS_ARRAY) ? $value : self::STATUS_ARRAY[1];
            }],
            [['status'],'default', 'value' => self::STATUS_ARRAY[1]],
            [['createDate', 'updateDate'], 'default', 'value'=>time()],
            [['describes'], 'default' , 'value'=>'']
        ];
    }

    public function attributes(){
        return [
            '_id',
            'name',
            'describes',
            'address',
            'telephone',
            'status',
            'createDate',
            'updateDate'
        ];
    }

    public function attributeLabels(){
        return [
            '_id' => 'ID',
            'name' => '名称',
            'describes' => '描述',
            'address' => '地址',
            'telephone' => '电话',
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

    public function deleteById($_id){
        if(empty($_id)){
            return 0;
        }
        $model = $this->findOne(['_id'=>$_id,'status'=>self::STATUS_ARRAY[1]]);
        if(empty($model)){
            return -1;
        }
        return $model->delete();
    }
}