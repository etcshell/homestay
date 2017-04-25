<?php

namespace common\models\mongodb;

use yii\mongodb\ActiveRecord;

/**
 * Class Store 药品
 * @property string $name
 * @property double $originalPrice
 * @property double $presentPrice
 * @property integer $categoryId
 * @property integer $total
 * @property string $describes
 * @property integer $status
 * @property integer $createDate
 * @property integer $updateDate
 */
class Medicine extends ActiveRecord{

    const NAME_MAX_LENGHT = 30;
    const DESCIBES_MAX_LENGHT = 100;
    const STATUS_ARRAY = [0,1];  //0=>删除 1=>启用

    public static function collectionName(){
        return 'medicine';
    }

    public function rules(){
        return [
            [['name', 'originalPrice', 'presentPrice','categoryId','total'], 'required'],
            [['name'], 'string', 'max'=>self::NAME_MAX_LENGHT],
            [['name'],'unique'],
            [['originalPrice', 'presentPrice'] , 'double'],
            [['originalPrice'], 'compare', 'compareAttribute'=>'presentPrice', 'operator'=>'>='],
            [['total','categoryId', 'status', 'createDate', 'updateDate'], 'integer'],
            [['status'],'filter','filter' => function($value){
                return in_array($value, self::STATUS_ARRAY) ? $value : self::STATUS_ARRAY[1];
            }],
            [['status'],'default', 'value' => self::STATUS_ARRAY[1]],
            [['createDate', 'updateDate'], 'default', 'value'=>time()],
            [['describes'], 'string' , 'max'=> self::DESCIBES_MAX_LENGHT],
            [['describes'], 'default' , 'value'=>'']
        ];
    }

    public function attributes(){
        return [
            '_id',
            'name',
            'originalPrice',
            'presentPrice',
            'categoryId',
            'total',
            'describes',
            'status',
            'createDate',
            'updateDate'
        ];
    }

    public function attributeLabels(){
        return [
            '_id' => 'ID',
            'name' => '名称',
            'originalPrice' => '原价',
            'presentPrice' => '现价',
            'categoryId' => '分类ID',
            'total' => '总数',
            'describes' => '描述',
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