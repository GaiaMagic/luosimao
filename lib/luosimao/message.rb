require 'json'
require 'uri'
require 'net/http'

module Luosimao
  module Message
    SEND_URL = "https://sms-api.luosimao.com/v1/send.json"
    DEPOSIT_URL = "https://sms-api.luosimao.com/v1/status.json"

    class RequestException < StandardError; end

    def self.to(phone, content)
      url = URI.parse SEND_URL
      post = Net::HTTP::Post.new(url.path)
      post.basic_auth(Luosimao.username, "key-#{Luosimao.key}")
      post.set_form_data(mobile: phone, message: "#{content} #{Luosimao.brand}")

      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true
      https.read_timeout = 5
      https.open_timeout = 5
      response = https.start {|socket| socket.request(post)}
      JSON.parse response.body
    end

    def self.to!(phone, content)
      json = to(phone, content)
      json['error'] == 0 || raise(RequestException.new(json))
    end

    def self.deposit_check
      uri = URI.parse DEPOSIT_URL
      req = Net::HTTP::Get.new uri
      req.basic_auth(Luosimao.username, Luosimao.key)

      res = Net::HTTP.start(uri.host, uri.port,
        :use_ssl => uri.scheme == 'https') do |http|
        http.request req
      end
      JSON.parse res.body
    end
  end
end
