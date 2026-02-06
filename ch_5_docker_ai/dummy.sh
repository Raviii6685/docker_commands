#how can we check our docker model status
docker model status 


#how can we pull any docker model from the docker hub
docker model pull model_name

#how can we list down all the docker models present in our local repositroy 
docker model ls 

#how can we inspect a docker model manifest file 
docker manifest inspect qwen3:0.6B-Q4_K_M<model-name>


#how can we run a docker model 
docker model run qwen3:0.6B-Q4_K_M


#how can we check all our model layers in our system 
ls -lh ~/.docker/models/blobs/sha256
#how can we inspect the particular layer of the model
cat ~/.docker/models/blobs/sha256/26b25afe22cf0e61a88c4e77fb8fd425cc7942aeff824a459b46135046480d7c | jq

#how can we inspect the particular model
docker model inspect qwen3:0.6B-Q4_K_M<model_name>


#how can we using the endpoint check our models present #this will list our models
curl -s localhost:12434/engines/v1/models
        #for more readibilty add
        curl -s localhost:12434/engines/v1/models | jq 

#how can curl a request for the chat to the particular model using the endpoint
curl -s http://localhost:12434/engines/v1/chat/completions \
-H "Content-Type: application/json" \
-d '{
"model": "ai/qwen3:0.6B-Q4_K_M",
"messages": [
{
"role": "system",
"content": "Keep your responses to one sentence only."
},
{
"role": "user",
"content": "How long is a day on Mars?"
}
],
"temperature": 0.7,
"max_tokens": 500
}' | jq -r '.choices[0].message.content'


#how can we build a compose and then run from the multicpontainer like app
#this is a good command aas you can see --build helps to ignore all the cache that are present in the local repository 
#forceful rebuild 
docker compose up --build --detach 


#how can we check our model status (DMR  status actually)
docker model status


#how can we remove the model 
docker model rm <model_name>


#how can we check the logs for the particualar compose file 
docker compose logs