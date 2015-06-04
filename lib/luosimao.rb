require "luosimao/version"
require "luosimao/message"

module Luosimao
  class << self
    attr_accessor :username, :key, :brand
  end

  def self.send_to(phone, content)
    Message.to(phone, content)
  end

  def self.send_to!(phone, content)
    Message.to!(phone, content)
  end

  def self.deposit_check
    Message.deposit_check
  end
end
