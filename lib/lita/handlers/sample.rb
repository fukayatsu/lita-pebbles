require 'securerandom'

module Lita
  module Handlers
    class Sample < Handler

      route /^sample (?:([0-9]) )?(.+)/, :sample, command: false,
        help: { 'sample [n] [foo] [bar] [baz]...' => '[foo] に決めた！' }
      def sample(response)
        total, list = response.matches.flatten
        total ||= 1
        list = list.split.shuffle(random: SecureRandom)

        total.to_i.times do
          item = list.pop
          break unless item
          response.reply "#{item} に決めた！"
        end
      end
    end
    Lita.register_handler(Sample)
  end
end
