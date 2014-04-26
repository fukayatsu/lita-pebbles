# lita-pebbles

A Lita handler for fun :)

## Installation

Add this line to your lita's Gemfile:

    gem 'lita-pebbles'

And then execute:

    $ bundle

## Usage

```
# lita_config.rb (example)
Lita.configure do |config|
  config.handlers.schedules.room              = ENV["BOT_ROOM_ID"]
  config.handlers.schedules.should_sleep_at   = '* * * * * Asia/Tokyo'
  config.handlers.schedules.should_wake_up_at = '* * * * * Asia/Tokyo'
end
```


```
Lita: sudden 突然の死
Lita: flip foobar
Lita: omikuji
Lita: misawa
...
```


## Contributing

1. Fork it ( http://github.com/<my-github-username>/lita-pebbles/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
