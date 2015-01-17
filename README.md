# Luosimao

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'luosimao'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install luosimao

## Usage
### Config
```ruby
Luosimao.username = "danche"
Luosimao.key      = "dianying"
Luosimao.brand    = "【单车电影】"
```
### Send message
```ruby
Luosimao::Message.to "10086", "hello world!"
```
## Contributing

1. Fork it ( https://github.com/[my-github-username]/luosimao/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
