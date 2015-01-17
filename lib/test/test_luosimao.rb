# coding: utf-8
require 'test/unit'
require 'luosimao'

class LuosimaoTest < Test::Unit::TestCase
	def setup
		Luosimao.username = "your_username"
		Luosimao.key = "your_key"
		Luosimao.brand = "your_brand"
		@right_phone = "10086"
		@wrong_phone = "020"
		@right_msg = "hello world"
		@empty_msg = ""
		@sensitive_msg = "共产党"
	end

	def test_send_to_wrong_phone
		assert_equal Luosimao::Message.to(@wrong_phone, @right_msg)["error"], -40
	end

	def test_send_right_message
		assert_equal Luosimao::Message.to(@right_phone, @right_msg),
			{"error" => 0, "msg" => "ok"}
	end

	def test_send_empty_message
		temp = Luosimao.brand
		Luosimao.brand = ''
		assert_equal Luosimao::Message.to(@right_phone, @empty_msg)["error"], -30
		Luosimao.brand = temp
	end

	def test_send_sensitive_message
		assert_equal Luosimao::Message.to(@right_phone, @sensitive_msg)["error"], -31
	end

	def test_check_deposit
		assert_equal Luosimao::Message.deposit_check["error"], 0
	end

	def test_fail_check_deposit
		Luosimao.key = "testkey"
		assert_equal Luosimao::Message.deposit_check["error"], -10
	end
end