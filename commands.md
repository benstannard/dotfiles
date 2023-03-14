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
`kubectl get namespaces` or `k get ns`  
`kubectl get pods -n namespace -o wide|yaml|json|name`  
`kubectl logs -f pod-name -n namespace`  
`kubectl describe pod -n namespace`  
`kubectl exec -it $p -n namespace -c container --sh`  
`kubectl get events --namespace=1password`  


## Bash
`cat etc/os-release`  
`uname -n -m`       machine-hardware  
