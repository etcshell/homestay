<?php
namespace api\modules\v1\controllers;

use Yii;
use api\components\AuthController;
use yii\data\ActiveDataProvider;

class MessageController extends AuthController
{

    public $modelClass = 'common\models\mongodb\UserMessage';

    public function actionIndex()
    {
        $modelClass = $this->modelClass;
        $query = $modelClass::find();
        return new ActiveDataProvider([
            'query' => $query
        ]);

    }

    public function actionCreate()
    {
        $model = new $this->modelClass();
        $model->attributes = Yii::$app->request->post();
        if (! $model->save()) {
            return $this->output([], 0, array_values($model->getFirstErrors())[0]);
        }
        return $this->output($model);
    }

    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $model->attributes = Yii::$app->request->post();
        if (! $model->save()) {
            return $this->output([], 0, array_values($model->getFirstErrors())[0]);
        }
        return $this->output($model);
    }

    public function actionDelete($id)
    {
        return $this->output($this->findModel($id)->delete());
    }

    public function actionView($id)
    {
        return $this->output($this->findModel($id));
    }

    protected function findModel($id)
    {
        $modelClass = $this->modelClass;
        if (($model = $modelClass::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
