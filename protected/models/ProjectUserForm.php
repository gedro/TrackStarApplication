<?php

/**
 * ProjectUserForm class.
 * ProjectUserForm is the data structure for keeping
 * the form data related to adding an existing user to a project. It
 * is used by the 'Adduser' action of 'ProjectController'.
 */
class ProjectUserForm extends CFormModel {
    /**
     * @var string username of the user being added to the project
     */
    public $username;
    
    /**
     * @var string the role to which the user will be associated within the project
     */
    public $role;
    
    /**
     * @var object an instance of the Project AR model class
     */
    public $project;
    
    /**
     * Declares the validation rules.
     * The rules state that username and role are required,
     * and role needs to be authenticated using the verify() method
     */
    public function rules() {
        return array(
            // username and role are required
            array('username, role', 'required'),
            // role needs to be authenticated
            array('username', 'exist', 'className'=>'User'),
            array('username', 'verify'),
        );
    }

    /**
     * Authenticates the existence of the user in the system.
     * If valid, it will also make the association between the user, role and project
     * This is the 'verify' validator as declared in rules().
     */
    public function verify($attribute, $params) {
        // we only want to authenticate when no other input errors are present
        if(!$this->hasErrors()) {
            $user = User::model()->findByAttributes(array('username' => $this->username));
            if(!$user->addProjectRole($this->project, $this->role)) {
                $this->addError('username', 'This user has already been added to the project.');
            }
        }
    }
}

