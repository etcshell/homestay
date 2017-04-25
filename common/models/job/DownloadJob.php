<?php
namespace common\models\job;

use common\models\job\BaseJob;

class DownloadJob extends BaseJob
{
    public $url;
    public $file;

    public function run()
    {
        file_put_contents($this->file, file_get_contents($this->url));
    }
}
