# ruby-project-sandbox

An experimental ruby project to test out various tools.

## Requirements

- Ruby >= 3.0.0 (managed with rbenv)
- Bundler

## Project Structure

```bash
.
├── Gemfile                   # Ruby dependencies
├── Rakefile                  # Task definitions
├── lib/
│   └── json_parser.rb        # Main implementation
└── spec/
    ├── spec_helper.rb        # RSpec configuration
    └── json_parser_spec.rb   # Test implementation
```

## Setup

First, ensure you have rbenv installed

```bash
# Install rbenv if not already installed
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'eval "$(~/.rbenv/bin/rbenv init - bash)"' >> ~/.bashrc
source ~/.bashrc
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

# Install Ruby
rbenv install 3.2.6
rbenv local 3.2.6

# Install dependencies
gem install bundler
bundle install
```

## Usage

Run the JSON parser

```bash
# Using rake
bundle exec rake start

# Or directly with Ruby
ruby lib/json_parser.rb
```

Run tests

```bash
# Using rake
bundle exec rake test

# Or directly with RSpec
bundle exec rspec
```

## Rake Tasks

- `rake start`: Run the JSON parser
- `rake test`: Run the test suite
- `rake` (default): Run tests

## Implementation Details

### lib/json_parser.rb

Contains the main JSON parsing functionality in the `JsonVarsSetter` module

- `JsonParser.parse_config(file_path, silent: false)`: Parse JSON configuration file
- `file_path`: Path to JSON file
- `silent`: Boolean to suppress error messages (optional)

### spec/json_parser_spec.rb

Contains RSpec test cases.

## JSON Configuration Format

```json
{
    "os": [
        "ubuntu-latest",
        "windows-latest",
        "macos-latest"
    ],
    "versions": {
        "ruby": [
            "3.0.6",
            "3.1.6",
            "3.2.6"
        ]
    },
    "ghpages_branch": "ghgapes"
}
```

## Development

This project uses

- RSpec for testing
- Rake for task automation
- JSON gem for parsing
- rbenv for Ruby version management

### Adding New Features

1. Make your changes in `lib/`
2. Add tests in `spec/`
3. Run tests to verify
4. Update documentation if needed

### Ruby Version Management

Using rbenv

```bash
# List available versions
rbenv install -l

# Install specific version
rbenv install <version>

# Set local version
rbenv local <version>
```
