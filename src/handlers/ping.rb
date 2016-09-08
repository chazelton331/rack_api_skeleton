module Handlers
  class Ping < Base

    def body
      { message: "ok" }
    end

    def code
      200
    end

  end
end
