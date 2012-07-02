module Teleportd
  class GetSearchResult < SearchResult

    # Returns the associated comment information from the Get request
    # as hashes.
    #
    # @return [Array<Hash>]
    def comments
      result_hash['cmt']
    end

  end
end
