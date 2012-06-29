module Teleportd
  class Request
    def initialize uri
      @uri = Config.base_url << uri
    end

    def parsed_response
      JSON.parse(response)
    end

    private
    def response
      @response ||= make_request.body_str
    end

    def make_request
      Curl::Easy.perform(@uri)
    end
  end

end
