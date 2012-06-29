module Teleportd
  class Search

    class << self
      def potential_available_filters
        [:location, :textual_search, :time_period, :size_filter, :from_filter, :sort_filter]
      end
    end

    attr_reader :opts

    def initialize opts={}
      @opts = opts
      @request = Request.new(request_uri)
    end

    def result
      @request.parsed_response
    end

    private
    def request_uri
      available_filters.each_with_object(base_request_uri) do |filter, uri|
        uri << "&#{self.send(filter)}"
      end
    end

    def base_request_uri
      "/search?user_key=#{Config.api_key}"
    end

    def available_filters
      Search.potential_available_filters.each_with_object([]) do |filter, available|
        available << filter unless self.send(filter).nil?
      end
    end

    def has_location?
      loc = opts[:location]
      !!loc && loc.has_key?(:latitude) && loc.has_key(:longitude) && loc.has_key(:vertical) && loc.has_key(:horizontal)
    end

    def location
      return nil unless has_location?
      loc = opts[:location]
      "loc=[#{loc[:latitude]},#{loc[:longitude]},#{loc[:vertical]},#{loc[:horizontal]}]"
    end

    def has_textual_search?
      opts.has_key?(:textual_search)
    end

    def textual_search
      return nil unless has_textual_search?
      "str=#{URI.encode(opts[:textual_search])}"
    end

    def has_time_search?
      time_period = opts[:time_period]
      !!time_period && time_period.has_key?(:start_time) && time_period.has_key?(:end_time)
    end

    def time_period
      return nil unless has_time_search?
      begin_period = opts[:time_period][:start_time].to_i
      end_period = opts[:time_period][:end_time].to_i
      "period=[#{begin_period},#{end_period}]"
    end

    def has_size_filter?
      opts.has_key?(:size)
    end

    def size_filter
      return nil unless has_size_filter?
      "size=#{opts[:size]}"
    end

    def has_from_filter?
      opts.has_key?(:from)
    end

    def from_filter
      return nil unless has_from_filter?
      "from=#{opts[:from]}"
    end

    def has_sort_filter?
      opts.has_key?(:sort) && opts[:sort] == ('relevance' || 'recency')
    end

    def sort_filter
      return nil unless has_sort_filter?
      "sort=#{opts[:sort]}"
    end
  end
end
