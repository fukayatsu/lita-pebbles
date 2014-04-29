require "lita"
require 'flippy'
require 'pebbles/suddenly_death_string'

module Lita
  module Handlers
    class Pebbles < Handler
      route /^sudden\s+(\S.*)+/, :suddenly_death, command: false,
        help: { "sudden [message]" => "＞ message ＜" }
      def suddenly_death(response)
        word = response.matches[0][0]
        response.reply word.to_suddenly_death
      end

      route /^flip\s(.*)$/, :flip, command: false,
        help: { "flip [message]" => "əɓɐssəɯ" }
      def flip(response)
        response.reply response.matches[0][0].flip
      end

      route /((w|ｗ)+)$/, :lol, command: false
      def lol(response)
        return if rand(2) == 0
        response.reply response.matches[0][0]
      end

      route /つらい$/, :tsurai, command: false
      def tsurai(response)
        return if rand(3) == 0
        response.reply "ねな( ˘ω˘)"
      end

      route /しのう$/, :shino, command: false
      def shino(response)
        return if rand(3) == 0
        response.reply "いきよう( ˘ω˘)"
      end

      route /\( ?˘ω˘\)\"?/, :suya, command: false # " this comment is workaround for sublime text syntax highlighting
      def suya(response)
        return if rand(2) == 0
        response.reply response.matches[0]
      end
    end
    Lita.register_handler(Pebbles)
  end
end