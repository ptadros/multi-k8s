docker build -t ptadros/multi-client:latest -t ptadros/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t ptadros/multi-server:latest -t ptadros/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t ptadros/multi-worker:latest -t ptadros/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push ptadros/multi-client:latest
docker push ptadros/multi-server:latest
docker push ptadros/multi-worker:latest

docker push ptadros/multi-client:$SHA
docker push ptadros/multi-server:$SHA
docker push ptadros/multi-worker:$SHA

kubectl apply -f k8s/
kubectl set image deployments/server-deploy server=ptadros/multi-server:$SHA
kubectl set image deployments/client-deploy client=ptadros/multi-client:$SHA
kubectl set image deployments/worker-deploy worker=ptadros/multi-worker:$SHA