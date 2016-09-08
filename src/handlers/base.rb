module Handlers
  class Base

    def formatted
      [
        code.to_s,
        { 'Content-Type' => 'application/json' },
        [ body.to_json ],
      ]
    end

    def body; raise "define me"; end
    def code; raise "define me"; end

  end
end
