$LOAD_PATH.unshift(File.expand_path('./src/handlers'))

Dir.glob("./src/handlers/*.rb").each { |file| require file }

class Router

  def initialize(env)
    @verb         = env["REQUEST_METHOD"] # for example, "GET"
    @path         = env["REQUEST_PATH"  ] # for example, "/person/123/attrs.json"
    @query_string = env["QUERY_STRING"  ] # for example, "name=foo&video=true&a[]=1&a[]=2&a[]=3"

    if @verb == "POST"
      begin
        request = Rack::Request.new(env)
        @params = JSON.parse(request.body.read)
      rescue
        @params = {}
      end
    end
  end

  # add new routes here and pass @params and/or @query_string to the Handler class
  def response
    case [ @path, @verb ]
    when [ "/ping", "GET" ]; Handlers::Ping.new
    else;                    Handlers::Unsupported.new
    end
  end

end
