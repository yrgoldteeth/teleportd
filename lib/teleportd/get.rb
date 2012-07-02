module Teleportd
  class Get

    attr_reader :sha

    # Accepts either a Teleportd::SearchResult or a string representing the sha of a result
    #
    # @params [sha_or_search_result]
    # @return [Teleportd::Get]
    def initialize sha_or_search_result
      @sha = handle_sha(sha_or_search_result)
      @request = Request.new(request_uri)
    end


    # Returns a Teleportd::GetSearchResult representing the get search
    #
    # @return [Teleportd::GetSearchResult]
    def result
      @result ||= GetSearchResult.new(@request.parsed_response['hit'])
    end

    private
    def handle_sha sha_or_search_result
      sha_or_search_result.is_a?(Teleportd::SearchResult) ? sha_or_search_result.sha : sha_or_search_result
    end

    def request_uri
      "/get?user_key=#{Config.api_key}&sha=#{sha}"
    end
  end
end
