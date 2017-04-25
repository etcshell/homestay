<?php
/**
 * @author: 61558262@qq.com
 */

namespace common\models\mongodb;

use yii;
use yii\helpers\Html;
USE yii\mongodb\ActiveRecord;

/**
 * @property string toUserId
 * @property int category
 * @property string title
 * @property string content
 * @property mixed status
 * @property string fromUserId
 * @property int createDate
 * @property int updateDate
 */
class UserMessage extends ActiveRecord
{

    const STATUS_UNREAD = 1;
    const STATUS_READED = 0;
    const STATUS_DELETE = 2;
    const CATEGORY_SYSTEM = 1;
    const CATEGORY_USER = 2;


    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['content', 'toUserId', 'fromUserId'], 'required'],
            [['title', 'content'], 'string', 'max' => 200],
            [['title'], 'default', 'value' => function ($model, $attribute) {
                return '系统消息';
            }],
            [['title', 'content'], 'filter', 'filter' => function ($value) {
                return Html::encode($value);
            }],
            [['category', 'status'], 'filter', 'filter' => function ($value) {
                return intval($value);
            }],
            [['status'], 'filter', 'filter' => function ($value) {
                return in_array($value, [self::STATUS_UNREAD, self::STATUS_READED, self::STATUS_DELETE]) ? $value : self::STATUS_UNREAD;
            }],
            [['createDate'], 'filter', 'filter' => function ($value) {
                if ($value == '') {
                    return time();
                }else{
                    return $value;
                }
            }],
            [['updateDate'], 'filter', 'filter' => function ($value) {
                    return time();
            }],
            [['content'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public static function collectionName()
    {
        return 'user_message';
    }


    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'title' => '标题',
            'content' => '内容',
            'createDate' => '发布日期',
            'updateDate' => '修改日期',
            'toUserId' => '收件人',
            'fromUserId' => '发件人',
            'category' => '类型',
            'status' => '状态',
        ];
    }

    /**
     *只要是集成mongodb/activerecord的子类都需要实现该方法
     *available attributes
     */
    public function attributes()
    {
        return ['_id', 'title', 'content', 'createDate', 'updateDate', 'status', 'category', 'toUserId', 'fromUserId'];
    }
}
