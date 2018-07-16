# frozen_string_literal: true

module TopsConnect
  class ApiError < ::RuntimeError
    def initialize(response)
      @response = response
    end

    def to_s
      format(
        '%<code>s: %<message>s (%<uri>s)',
        code: @response.code,
        message: self.class.error_message(@response.parsed_response),
        uri: @response.request.last_uri.to_s
      )
    end

    def self.error_message(parsed_response)
      case parsed_response
      when String
        parsed_response
      when Hash
        parsed_response.dig('Message')
      else
        ''
      end
    end
  end

  # The client submitted invalid information.
  class ClientError < ApiError
  end

  # A request was made for a key/query that doesn't exist.
  class NotFoundError < ClientError
  end

  # Something happened but we don't know what and it's probably not our fault.
  class InternalError < ApiError
  end

  # The API took too long to respond, but everything might be fine later.
  class TimeoutError < InternalError
  end
end
