require "faraday_boolean/version"
require "faraday"

module FaradayBoolean
  autoload :ParseBoolean, "faraday_boolean/parse_boolean"

  Faraday::Response.register_middleware(
    boolean: -> { ParseBoolean },
  )
end
