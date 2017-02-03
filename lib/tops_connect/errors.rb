# frozen_string_literal: true
module TopsConnect
  class ApiError < ::RuntimeError
    def initialize(response)
      @response = response
    end

    def to_s
      format(
        '%{code}: %{message} (%{uri})',
        code: @response.code,
        message: @response.parsed_response&.dig('Message'),
        uri: @response.request.last_uri.to_s
      )
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
