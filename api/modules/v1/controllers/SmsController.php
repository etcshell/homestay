<?php
namespace api\modules\v1\controllers;

use Yii;
use api\components\AuthController;
use yii\data\ActiveDataProvider;

class SmsController extends AuthController
{

    public $modelClass = 'common\models\mongodb\UserSms';

    public function actionCreate()
    {
        $model = new $this->modelClass();
        $model->attributes = Yii::$app->request->post();
        if (! $model->save()) {
            return $this->output(array_values($model->getFirstErrors())[0]);
        }
        return $this->output($model);
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
