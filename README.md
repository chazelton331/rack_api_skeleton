### Running The App

To start the application, invoke:

```
rackup -p PORT_NUM
```

### Example Request

##### Ping

```
$ curl -v -X GET 'localhost:3333/ping'; echo
```

```
< HTTP/1.1 200 OK
< Content-Type: application/json
...
{"message":"ok"}
```


### TODO

* Path parser for env["REQUEST_PATH"]
* Query string parser for env["QUERY_STRING"]
