<?php

namespace api\modules\v1\controllers;

use Yii;
use api\components\AuthController;
use yii\data\ActiveDataProvider;

class OrderController extends AuthController{

    public $modelClass = 'common\models\mongodb\Order';

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
        if(!isset($param['no'])){
            $param['no'] = $this->_createOrderNo();
        }
        $model->attributes = $param;
        if(! $model->save()){
            return $this->output([], 0, array_values($model->getFirstErrors())[0]);
        }
        return $this->output($model);
    }

    /**
     * 生成订单号
     * @return string
     */
    private function _createOrderNo(){
        $model = new $this->modelClass;
        $no = date("YmdHis").rand(100000,999999);
        $rs = $model->findOne(['no'=>$no]);
        if(!empty($rs)){
            $this->_createOrderNo();
        }
        return $no;
    }

    public function actionView(){
        $no = Yii::$app->request->get('no');
        $model = new $this->modelClass;
        $rs = $model->getOnesByNo($no);
        if(!$rs) {
            return $this->output([], 0, 'Record Empty!');
        }
        return $this->output($rs);
    }

    public function actionUpdate(){
        $model = new $this->modelClass;
        $param = Yii::$app->request->post();
        if(!isset($param['no'])){
            return $this->output([], 0, 'param no not exits!');
        }
        $rs = $model->updateByNo($param['no'], $param);
        if($rs === 0){
            return $this->output([], 0, 'param no not exits! or param empty!');
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
        $no = Yii::$app->request->post('no');
        $model = new $this->modelClass;
        $rs = $model->deleteByNo($no);
        if($rs === 0){
            return $this->output([], 0, 'paran Error');
        }else if($rs === -1){
            return $this->output([], 0, 'record not exits!');
        }
        return $this->output([]);
    }
}