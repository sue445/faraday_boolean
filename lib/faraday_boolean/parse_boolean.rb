module FaradayBoolean
  # When response body is "true" or "false" (String), convert to true or false (Ruby literal)
  class ParseBoolean < ::Faraday::Response::Middleware
    def call(env)
      response = @app.call(env)

      case response.env[:body]
      when "true"
        response.env[:body] = true
      when "false"
        response.env[:body] = false
      end

      response
    end
  end
end
