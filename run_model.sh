#variables

data=$(date +'%Y-%m-%dT%H:%M:%S')

path='/home/soturno/Desktop/pa05'
path_to_envs='/home/soturno/.pyenv/shims'

$path_to_envs/papermill /home/soturno/Desktop/pa05/model/look_9-ear-deploy.ipynb /home/soturno/Desktop/pa05/reports/look_9-ear-deploy_$data.ipynb
