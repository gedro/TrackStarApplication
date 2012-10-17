<?php
class IssueTest extends CDbTestCase {

    public function testGetTypes() {
        $options = Issue::model()->typeOptions;
        $this->assertTrue(is_array($options));
    }
}
