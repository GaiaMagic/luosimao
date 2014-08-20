# coding: utf-8
module Luosimao
  module Message
    URL = "https://sms-api.luosimao.com/v1/send.json"

    def send(phone, content)
      url = URL.parse URL
      post = Net::HTTP::Post.new(url.path)
      post.basic_auth(Luosimao.username, Luosimao.key)
      post.set_form_data({mobile: phone, message: "#{content}#{Luosimao.brand}"})

      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true
      response = https.start {|socket| socket.request(post)}
      JSON.parse response.body
    end
  end
end
