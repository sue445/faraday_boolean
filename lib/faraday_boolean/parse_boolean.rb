require "faraday"

module FaradayBoolean
  # When response body is "true" or "false" (String), convert to true or false (Ruby literal)
  class ParseBoolean < ::Faraday::Middleware
    def on_complete(env)
      case env[:body]
      when "true"
        env[:body] = true
      when "false"
        env[:body] = false
      end
    end
  end
end

Faraday::Response.register_middleware(boolean: FaradayBoolean::ParseBoolean)
