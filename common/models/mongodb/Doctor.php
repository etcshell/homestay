<?php

namespace common\models\mongodb;

use yii\mongodb\ActiveRecord;

/**
 * Class Doctor 医生
 * @property string $number
 * @property string $name
 * @property string $describes
 * @property string $mobile
 * @property string $certNumber
 * @property string $certImage
 * @property string $identity
 * @property integer $province
 * @property integer $city
 * @property integer $area
 * @property string $hospital
 * @property integer $occupationId
 * @property integer $departmentId
 * @property string $feat
 * @property integer $sex
 * @property string $birthday
 * @property string $picture
 * @property string $account
 * @property string $password
 * @property integer $status
 * @property integer $createDate
 * @property integer $updateDate
 */
class Doctor extends ActiveRecord{

    const NAME_MAX_LENGHT = 20;
    const DESCRIBES_MAX_LENGHT = 100;
    const PASSWORD_LENGHT = [6,12];
    const STATUS_ARRAY = [0,1];  //0=>删除 1=>启用
    const DEFAULT_PICTURE = '/image/user/picture/default_doctor.jpg';
    const DEAAULT_PASSWORD = '123456';
    const SEX_ARRAY = [0,1,2];  //0=>'其他',1=>'男',2=>'女'

    public static function collectionName(){
        return 'doctor';
    }

    public function rules(){
        return [
            [['number','name','mobile','certNumber','province','city','area','occupationId','departmentId'], 'required'],
            [['name','account'], 'string', 'max'=>self::NAME_MAX_LENGHT],
            [['password'],'string', 'length'=>self::PASSWORD_LENGHT],
            [['password'],'default','value'=>self::DEAAULT_PASSWORD],
            [['describes'], 'string', 'max'=>self::DESCRIBES_MAX_LENGHT],
            [['mobile'], 'unique'],
            [['mobile'], 'match', 'pattern'=>'/^1[34578]\d{9}$/','message'=>'mobile Format error'],
            [['number','certNumber','certImage','identity','hospital','feat','birthday','picture'], 'string'],
            [['identity'], 'match', 'pattern'=>'/^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/'],
            [['province','city','area','occupationId','departmentId','sex','status'],'integer'],
            [['status'], 'filter', 'filter'=>function($value){
                return in_array($value, self::STATUS_ARRAY) ? $value : self::STATUS_ARRAY[1];
            }],
            [['status'], 'default' ,'value'=> self::STATUS_ARRAY[1]],
            [['createDate','updateDate'], 'default', 'value'=>time()],
            [['describes','certImage','identity','hospital','feat','birthday','account'], 'default' , 'value'=>''],
            [['picture'], 'default', 'value'=>self::DEFAULT_PICTURE],
            [['sex'], 'default' , 'value'=>self::SEX_ARRAY[0]],
            [['sex'],'filter','filter' => function($value){
                return in_array($value, self::SEX_ARRAY) ? $value : self::SEX_ARRAY[0];
            }],
            [['province','city','area','occupationId','departmentId','sex','status'],'filter', 'filter'=>function($value){
                return intval($value);
            }],
        ];
    }

    public function attributes(){
        return [
            '_id',
            'number',
            'name',
            'describes',
            'mobile',
            'certNumber',
            'certImage',
            'identity',
            'province',
            'city',
            'area',
            'hospital',
            'occupationId',
            'departmentId',
            'feat',
            'sex',
            'birthday',
            'picture',
            'account',
            'password',
            'status',
            'createDate',
            'updateDate'
        ];
    }

    public function attributeLabels(){
        return [
            '_id' => 'ID',
            'number' => '编号',
            'name' => '姓名',
            'describes' => '描述',
            'mobile' => '手机号',
            'certNumber' => '证书编号',
            'certImage' => '证书图片',
            'identity' => '身份证号',
            'province' => '省份',
            'city' => '市',
            'area' => '区',
            'hospital' => '医院',
            'occupationId' => '职称ID',
            'departmentId' => '科室ID',
            'feat' => '专长',
            'sex' => '性别',
            'birthday' => '生日',
            'picture' => '头像',
            'account' => '用户账号',
            'password' => '密码',
            'status' => '状态',
            'createDate' => '创建时间',
            'updateDate' => '更新时间'
        ];
    }

    public function getList($param){
        $where = $this->_createWhere($param);
        $list = $this->find()->where($where)->orderBy('createDate');
        return $list;
    }

    private function _createWhere($param){
        $where = array('status'=> self::STATUS_ARRAY[1]);
        return $where;
    }

    public function getOnesById($id){
        return $this->findOne(['_id'=>$id,'status'=> self::STATUS_ARRAY[1]]);
    }

    public function updateById($id, $param){
        if(isset($param['id'])){
            unset($param['id']);
        }
        if(empty($id) || empty($param)){
            return 0;
        }
        $model = $this->findOne(['_id'=>$id,'status'=> self::STATUS_ARRAY[1]]);
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
        $model = $this->findOne(['_id'=>$id,'status'=> self::STATUS_ARRAY[1]]);
        if(empty($model)){
            return -1;
        }
        return $model->delete();
    }
}