### Running The App

To start the application, invoke:

```
rackup -p PORT_NUM
```

### Example Request

##### Ping (assumes you ran `rackup -p 3333`)

```
$ curl -v -X GET 'localhost:3333/ping'; echo
```

```
< HTTP/1.1 200 OK
< Content-Type: application/json
...
{"message":"ok"}
```


### Todo

* Path parser for `env["REQUEST_PATH"]`
* Query string parser for `env["QUERY_STRING"]`
