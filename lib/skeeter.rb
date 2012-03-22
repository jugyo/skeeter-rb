require "skeeter/version"
require 'open-uri'
require 'erb'

module Skeeter
  class << self
    attr_writer :base_url

    def base_url
      @base_url ||= 'http://skeeter.blakesmith.me/'
    end

    def get(url, options = {})
      width = options.fetch(:width, 100)
      open("#{base_url}?image_url=#{ERB::Util.url_encode(url)}&width=#{width}").read
    end
  end
end
