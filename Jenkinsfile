@Library('terraform-shared-library') _

pipeline {

    agent any

    parameters {

        choice(
            name: 'ENV',
            choices: ['dev', 'qa'],
            description: 'Select Environment'
        )

        choice(
            name: 'ACTION',
            choices: ['plan', 'apply', 'destroy'],
            description: 'Select Terraform Action'
        )
    }

    environment {

        DEV_PATH = "env/dev/ec2"
        QA_PATH  = "env/qa/ec2"
    }

    stages {

        stage('Checkout Code') {

            steps {

                git branch: 'main',
                url: 'https://github.com/suraj8957/terraform-wrapper.git'
            }
        }

        stage('Set Terraform Path') {

            steps {

                script {

                    if (params.ENV == "dev") {

                        env.TF_PATH = env.DEV_PATH

                    } else if (params.ENV == "qa") {

                        env.TF_PATH = env.QA_PATH
                    }

                    echo "Terraform Path: ${env.TF_PATH}"
                }
            }
        }

        stage('Terraform Init') {

            steps {

                terraformInit(env.TF_PATH)
            }
        }

        stage('Terraform Validate') {

            steps {

                terraformValidate(env.TF_PATH)
            }
        }

        stage('Terraform Plan') {

            when {

                expression {

                    params.ACTION == 'plan' || params.ACTION == 'apply'
                }
            }

            steps {

                terraformPlan(env.TF_PATH)
            }
        }

        stage('Terraform Apply') {

            when {

                expression {

                    params.ACTION == 'apply'
                }
            }

            steps {

                input 'Approve Terraform Apply?'

                terraformApply(env.TF_PATH)
            }
        }

        stage('Terraform Destroy') {

            when {

                expression {

                    params.ACTION == 'destroy'
                }
            }

            steps {

                input 'Approve Terraform Destroy?'

                dir(env.TF_PATH) {

                    sh 'terraform destroy -auto-approve'
                }
            }
        }
    }

    post {

        success {

            echo 'Terraform Pipeline Executed Successfully'
        }

        failure {

            echo 'Terraform Pipeline Failed'
        }
    }
}
