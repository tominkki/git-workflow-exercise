# Git workflow exercise
This repository is school assignment for course 5G00ET62-3002. Repository contains tests for 
[automation practice website](http://automationpractice.com/index.php).
 Goal of this project is to get familiar with feature branch Git workflow.
# Technologies
* [Robot Framework](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
* [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)
# Features

## [Test for registration](register.robot)

Simple test for user registration. Test ensures that registration is possible with valid details. This test **does not** ensure that registration fails with invalid details.

### Usage
* [Set up the project](#setting-up-the-project)
* Run test: ```robot register.robot```
    * NOTE! You might have to change the ```${EMAIL}``` variable as the site seems to save users in database

# Setting up the project

## Prerequisites
* [Python 3.4+ and pip](https://www.python.org/)
* [virtualenv](https://pypi.org/project/virtualenv/)
* Google Chrome

## On Linux
* Open bash in /tests
* Create virtualenv: ```virtualenv test-env```
* Activate virtualenv: ```source test-env/bin/activate```
    * You can deactivate virtualenv with ```deactivate```
* Install dependencies: ```pip install -r requirements.txt```
* Install webdriver
    * ```sudo webdrivermanager chrome --linkpath /usr/local/bin```
* Run dummy test to see if everything works: ```robot dummy.robot```

## On Windows
* Install Linux and follow steps above :trollface:

# Contribution
On contribution we follow atlassian tutorial [Git Feature Branch Workflow.](https://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow)

## Adding a feature

* Clone the repository 
    * ```git clone https://github.com/tominkki/git-workflow-exercise.git```

* [Set up the project](#setting-up-the-project)

* Create a branch for your new feature 
    * ```git checkout -b <my-feature>```

* Create your new feature under /tests folder!

* Before submitting your PR
    * Make sure your new feature works like it should
    * Make sure requirements.txt is up to date
    * Make sure you have committed your changes
    * If your branch is not up to date with master, rebase your changes to latest master 
        * ```git pull --rebase origin master```
    * Push your new feature to your branch, if you have rebased you might have to use '--force' flag 
        * ```git push origin <my-feature>```
* Create your PR!
    * Write short descriptive title with prefix  'feat: ' 
        * ```feat: <my-feature>```
    * Add short description about new feature
    * Submit your PR! If everything is fine it will be merged to master.
