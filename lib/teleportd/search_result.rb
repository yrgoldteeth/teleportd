module Teleportd
  # Represents an individual image returned from a Search call
  class SearchResult

    # @api private
    attr_reader :result_hash

    # Accepts a hash from a Teleportd::Search and returns an instance of Teleportd::SearchResult
    #
    # @example
    #     Teleportd::SearchResult.new(result_hash)
    #     > #<Teleportd::SearchResult...>
    #
    # @param [Hash]
    # @return [Teleportd::SearchResult]
    def initialize result_hash={}
      @result_hash = result_hash
    end

    # Returns a Hash with the results latitude and longitude values
    #
    # @return [Hash]
    def location
      result_hash['loc']
    end

    # Returns a String representing the search result type (usually "image")
    #
    # @return [String]
    def type
      result_hash['typ']
    end

    # Returns a String representing the search result SHA hash
    #
    # @return [String]
    def sha
      result_hash['sha']
    end

    # Returns the result's time as seconds from the epoch
    #
    # @return [Fixnum]
    def date
      result_hash['dte']
    end

    # Returns the source of the result ("twimg", "instagram", etc.)
    #
    # @return [String]
    def source
      result_hash['src']
    end

    # Returns the thumbnail image url for the result
    #
    # @return [String]
    def thumbnail_url
      result_hash['thb']
    end

    # Returns the full resolution image url for the result
    #
    # @return [String]
    def full_resolution_url
      result_hash['fll']
    end

    # Returns the author handles identified from the result
    # NOTE: Will return nil unless you have an enterprise account
    #
    # @return [Array]
    def users
      result_hash['usr']
    end

    # Returns the user's profile pic url from the respective service account
    # NOTE: Will return nil unless you have an enterprise account
    #
    # @return [String]
    def profile_pic_url
      result_hash['pic']
    end

    # Returns the comments or title of the search result in an Array
    # NOTE: Will return nil unless you have an enterprise account
    #
    # @return [Array]
    def text
      result_hash['text']
    end

    # Returns the hashtags of the search result in an Array
    # NOTE: Will return nil unless you have an enterprise account
    #
    # @return [Array]
    def hashtags
      result_hash['hashtag']
    end

    # Returns the mentions of the search result in an Array
    # NOTE: Will return nil unless you have an enterprise account
    #
    # @return [Array]
    def mentions
      result_hash['mention']
    end

  end
end
