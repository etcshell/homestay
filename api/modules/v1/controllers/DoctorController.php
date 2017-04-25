<?php

namespace api\modules\v1\controllers;

use Yii;
use api\components\AuthController;
use yii\data\ActiveDataProvider;

class DoctorController extends AuthController{

    public $modelClass = 'common\models\mongodb\Doctor';

    public function actionIndex(){
        $model = new $this->modelClass;
        $param = Yii::$app->request->get();
        $query = $model->getList($param);
        return new ActiveDataProvider([
            'query' => $query
        ]);
    }

    public function actionCreate(){
        $model = new $this->modelClass;
        $param = Yii::$app->request->post();
        $param['number'] = $this->_createNumber($param);
        $model->attributes = $param;
        if (! $model->save()) {
            return $this->output([], 0, array_values($model->getFirstErrors())[0]);
        }
        return $this->output($model);
    }

    public function actionView(){
        $id = Yii::$app->request->get('id');
        $model = new $this->modelClass;
        $rs = $model->getOnesById($id);
        if(empty($rs)){
            return $this->output([], 0, 'Record Empty!');
        }
        return $this->output($rs);
    }

    public function actionUpdate(){
        $model = new $this->modelClass;
        $param = Yii::$app->request->post();
        if(!isset($param['id'])){
            return $this->output([], 0, 'param id not exits!');
        }
        $rs = $model->updateById($param['id'], $param);
        if($rs === 0){
            return $this->output([], 0, 'param id not exits! or param empty!');
        }else if($rs === -1){
            return $this->output([], 0, 'record not exits!');
        }
        $errors = $rs->getFirstErrors();
        if(!empty($errors)){
            return $this->output([], 0, array_values($errors)[0]);
        }
        return $this->output($rs);
    }

    public function actionDelete(){
        $id = Yii::$app->request->post('id');
        $model = new $this->modelClass;
        $rs = $model->deleteById($id);
        if($rs === 0){
            return $this->output([], 0, 'paran Error');
        }else if($rs === -1){
            return $this->output([], 0, 'record not exits!');
        }
        return $this->output([]);
    }

    /**
     * 通过省市区生成医生编号
     * @param $param
     * @return string
     */
    private function _createNumber($param){
        if(!isset($param['province']) || !isset($param['city']) || !isset($param['area'])){
            return '';
        }
        //根据省市区的拼音首字母+随机数生成编号
        $tmpStr = 'ssx';
        $model = new $this->modelClass;
        $number = $tmpStr . rand(100000,999999);
        $rs = $model->findOne(['number'=>$number]);
        if(!empty($rs)){
            return $this->_createNumber($param);
        }
        return $number;

    }
}