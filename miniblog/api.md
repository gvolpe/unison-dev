# miniblog
 
## POST /api/users
 
Create a new user, e.g.
 
```console
curl -X POST https://gvolpe.unison-services.cloud/s/miniblog/api/users \
  --header 'Content-Type: application/json' \
  --data '{"userHandle":"@gvolpe","name":"Gabriel Volpe","avatar":"https://avatars.githubusercontent.com/u/4439
78"}' | jq
 
{
  "userId": "some user id"
}
```
 
## POST /api/users/{handle}/posts
 
```console
curl -X POST https://gvolpe.unison-services.cloud/s/miniblog/api/users/@gvolpe/posts \
  --header 'Content-Type: application/json' \
  --data '{"body":"this is a simple blogpost"}' | jq
 
{
  "postId": "IAmAPostId"
}
```
 
## GET /api/users/{handle}/posts
 
```console
curl -X GET https://gvolpe.unison-services.cloud/s/miniblog/api/users/@gvolpe/posts | jq
 
[
  {
    "body": "blog post body",
    "name": "Ada Lovelace",
    "userHandle": "@ada",
    "timestamp": "2021-01-01T00:00:00Z"
  }
]
```
