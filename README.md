# RailsTemplateDebugger

Wraps rendered templates with html comments showing the template path. Also
throws in some meta tags which are easier to copy/paste in devtools.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_template_debugger'
```

and initialize the gem somewhere, e.g.

```ruby
# config/environments/development.rb
RailsTemplateDebugger.debug_templates
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RailsTemplateDebugger project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/rails_template_debugger/blob/master/CODE_OF_CONDUCT.md).
