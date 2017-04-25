<?php

namespace common\models\mongodb;

use yii\mongodb\ActiveRecord;

/**
 * Customer  客户
 * @property string $name
 * @property string $mobile
 * @property integer $sex
 * @property string $birthday
 * @property integer $age
 * @property string $picture
 * @property string $medicare
 * @property string $identity
 * @property string $occupation
 * @property integer $diploma
 * @property string $ethnic
 * @property integer $marriage
 * @property string $contactPerson
 * @property string $contactMobile
 * @property string $account
 * @property string $password
 * @property integer $isRegister
 * @property integer $status
 * @property integer $createDate
 * @property integer $updateDate
 */
class Customer extends ActiveRecord {

    const STATUS_ARRAY = [0,1];  //0=>删除 1=>启用
    const NAME_MAX_LENGHT = 10;
    const SEX_ARRAY = [0,1,2];  //0=>'其他',1=>'男',2=>'女'
    const DIPLOMA_ARRAY = [0,1,2,3,4,5,6,7];  //0=>'其他',1=>'小学',2=>'初中',3=>'高中',4=>'大学',5=>'硕士',6=>'博士',7=>'博士后'
    const MARRIAGE_ARRAY = [0,1,2,3];  //0=>'其他' 1=>'已婚',2=>'未婚',3=>'离异'
    const DEFAULT_PICTURE = '/image/user/picture/default_customer.jpg';
    const ACCOUNT_MAX_LENGHT = 20;
    const PASSWORD_MAX_LENGHT = [6,12];
    const ISREGISTER = [0,1];  //0=>未注册 1=> 已注册

    public static function collectionName(){
        return 'customer';
    }

    public function rules(){
        return [
            [['mobile','password'],'required'],
            [['name'], 'string' , 'max'=>self::NAME_MAX_LENGHT],
            [['mobile'],'unique'],
            [['mobile'], 'match', 'pattern'=>'/^1[34578]\d{9}$/','message'=>'mobile Format error'],
            [['sex','age','diploma','marriage','isRegister','status','createDate','updateDate'], 'integer'],
            [['sex'], 'default' , 'value'=>self::SEX_ARRAY[0]],
            [['sex'],'filter','filter' => function($value){
                return in_array($value, self::SEX_ARRAY) ? $value : self::SEX_ARRAY[0];
            }],
            [['diploma'], 'default', 'value'=>self::DIPLOMA_ARRAY[0]],
            [['diploma'],'filter','filter' => function($value){
                return in_array($value, self::DIPLOMA_ARRAY) ? $value : self::DIPLOMA_ARRAY[0];
            }],
            [['marriage'], 'default', 'value'=>self::MARRIAGE_ARRAY[0]],
            [['marriage'],'filter','filter' => function($value){
                return in_array($value, self::MARRIAGE_ARRAY) ? $value : self::MARRIAGE_ARRAY[0];
            }],
            [['isRegister'], 'default', 'value'=>self::ISREGISTER[1]],
            [['isRegister'],'filter','filter' => function($value){
                return in_array($value, self::ISREGISTER) ? $value : self::ISREGISTER[1];
            }],
            [['name','birthday','picture','medicare','identity','occupation','ethnic','contactPerson','contactMobile',],'string'],
            [['account'],'string', 'max'=>self::ACCOUNT_MAX_LENGHT],
            [['password'],'string', 'max' => self::PASSWORD_MAX_LENGHT],
            [['name','birthday','medicare','identity','occupation','ethnic','contactPerson','contactMobile','account','password'],'default', 'value'=>''],
            [['account'], 'unique'],
            [['picture'], 'default', 'value'=>self::DEFAULT_PICTURE],
            [['status'],'filter','filter' => function($value){
                return in_array($value, self::STATUS_ARRAY) ? $value : self::STATUS_ARRAY[1];
            }],
            [['status'],'default', 'value' => self::STATUS_ARRAY[1]],
            [['createDate', 'updateDate'],'default', 'value'=> time()],
            [['picture'], 'default', 'value'=>self::DEFAULT_PICTURE],
            [['sex','age','diploma','isRegister','status','createDate','updateDate'], 'filter', 'filter'=>function($value){
                return intval($value);
            }]
        ];
    }

    public function attributes(){
        return [
            '_id',
            'name',
            'mobile',
            'sex',
            'birthday',
            'age',
            'picture',
            'medicare',
            'identity',
            'occupation',
            'diploma',
            'ethnic',
            'marriage',
            'contactPerson',
            'contactMobile',
            'account',
            'password',
            'isRegister',
            'status',
            'createDate',
            'updateDate'
        ];
    }

    public function attributeLabels(){
        return [
            '_id' => 'ID',
            'name' => '真实姓名',
            'mobile' => '手机号',
            'sex' => '性别',
            'birthday' => '出生年月',
            'age' => '年龄',
            'picture' => '头像',
            'medicare' => '医保账号',
            'identity' => '身份证号码',
            'occupation' => '职业',
            'diploma' => '学历',
            'ethnic' => '民族',
            'marriage' => '婚姻',
            'contactPerson' => '联系人',
            'contactMobile' => '联系电话',
            'account' => '账号',
            'password' => '密码',
            'isRegister' => '是否注册',
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
