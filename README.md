# HTML::Pipeline::ImageLink

Image filter for [html\-pipeline](https://github.com/jch/html-pipeline).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'html-pipeline-image_link'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install html-pipeline-image_link

## Usage

```ruby
filter = HTML::Pipeline::ImageLinkFilter.new('https://example.com/test.png')
filter.call.to_s # => '<a href="https://example.com/test.jpg"><img src="https://example.com/test.jpg" alt=""></a>'
```

### context

- `https_only`: Only allow https url. (default `true`)
- `image_extensions`: Image File Extensions. (default: `%w[jpg jpeg bmp gif png]`)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/aki77/html-pipeline-image_link. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/aki77/html-pipeline-image_link/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Html::Pipeline::Image project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/aki77/html-pipeline-image_link/blob/master/CODE_OF_CONDUCT.md).
