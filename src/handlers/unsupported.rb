module Handlers
  class Unsupported < Base

    def body
      { error: true, message: "Unsupported request" }
    end

    def code
      400
    end

  end
end
