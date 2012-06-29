module Teleportd
  module Config
    extend self

    def api_key
      ENV['TELEPORTD_API_KEY'] ||= raise "ENV var for TELEPORTD_API_KEY must be set"
    end

    def base_url
      'http://api.teleportd.com'
    end
  end
end
