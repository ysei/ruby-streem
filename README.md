# Streem

This is a pure-Ruby implementation of the [Streem programming language](https://github.com/matz/streem) being developed by Yukihiro "Matz" Matsumoto, creator of Ruby. It is a proof-of-concept of what his vision might look like were it implemented as a Ruby library. It is intended to give Streem enthusiasts an opportunity to experiment with the *ideas* behind Streem while the language itself is being developed.

*This library is not intended to compete with or be a replacement for Streem. It is solely intended as a temporary stand-in that will increase the community's ability to provide feedback into Streem's design.*

Features of this library will closely mirror Streem and updates will be made as Streem evolves. Anyone interested in experimenting with Streem is encouraged to use this library and provide Matz feedback on [his issue page](https://github.com/matz/streem/issues).


## Installation

**Note:** This gem hasn't been pushed to Rubygems yet. For now you'll have to run it from the GitHub repo.

Add this line to your application's Gemfile:

```ruby
gem 'ruby-streem'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby-streem

## Usage

TODO: Write usage instructions here

See the examples in the `examples` directory.

```ruby
#!/usr/bin/env ruby

require 'streem'

stdin | stdout
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/streem. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

