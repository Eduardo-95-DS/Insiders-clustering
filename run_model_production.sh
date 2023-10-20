#variables

data=$(date +'%Y-%m-%dT%H:%M:%S')

path='/home/ec2-user/Insiders-clustering'
path_to_envs='/home/ec2-user/.pyenv/shims/'

$path_to_envs/papermill $path/model/look_10-ear-deploy.ipynb $path/reports/look_10-ear-deploy_$data.ipynb
