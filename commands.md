# Useful Bash Commands and Shortcuts

## Docker

`ctop`              ctop - top for containers  
`dc`                docker-compose  
`dcu`               docker-compose up -d  
`dcd`               docker-compose down  
`dcr`               docker-compose run  
`dex <container>`   execute a bash shell inside THE RUNNING <container>  
`di <container>`    docker inspect <container>  
`dim`               docker images  
`dip`               IP address of all running containers  
`dl <container>`    docker logs -f <container>  
`dnames`            names of all runing containers  
`dps`               docker ps  
`dpsa`              docker ps -a  
`drmc`              remove all exited containers  
`drmid`             remove all dangling images  
`drun <image>`      execute a bash shell in a NEW container from <image>  
`dsr <container>`   stop then remove <container>  
`docker compose up --build --force-recreate`  


## Kube
`kubectl api-resources`  
`kubectl get - list resources`  
`kubectl describe - show detailed information about a resource`  
`kubectl logs - print the logs from a container in a pod`  
`kubectl exec - execute a command on a container in a pod`  
`kubectl config use-context <cluster info>`  


`k-prod-gc`  
`kubectl cluster-info dump | less`  
`kubectl get nodes`  
`kubectl describe node <nodename>`  
`kubectl get deployment -n namespace`  
`kubectl describe deployment -n namespace`  
`kubectl proxy --port=8080`  
`kubectl get namespaces` or `k get ns`  
`kubectl get all -n namespace`  
`kubectl get pods -n namespace -o wide|yaml|json|name`  
`kubectl logs -f pod-name -n namespace`  
`kubectl describe pod -n namespace`  
`kubectl exec -it <podname> -n namespace -- env    dump env variables`  
`kubectl exec -it <podname> -n namespace -- bash   start bash session`  
`kubectl get events --namespace=1password`  
`kubectl get pvc -n namespace`  
`k rollout restart deployment.apps/redash-scheduler -n namespace`  

## Helm
`helm list --all-namespaces`  
`helm get values -n NAMESPACE RELEASE_NAME`  
`helm rollback RELEASE_NAME VERSION -n NAMESPACE`  



## Bash
`cat etc/os-release` OS Version
`uname -n -m`        machine-hardware  
`df -m`              free memory  
`cat /proc/cpuinfo`  CPU Details  



## Redis
`redis-cli -h XXX.XXX.XX.XXX --bigkeys`  

