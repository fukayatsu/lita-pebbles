require 'flippy'
require 'pebbles/suddenly_death_string'

module Lita
  module Handlers
    class Pebbles < Handler
      route /^sudden\s+(\S.*)+/, :suddenly_death, command: false,
        help: { "sudden [message]" => "＞ message ＜" }
      def suddenly_death(response)
        word = response.matches[0][0]
        response.reply_without_mention word.to_suddenly_death
      end

      route /^(ghost|echo)\s+(\S.*)+/, :echo, command: false
      def echo(response)
        word = response.matches[0][1]
        response.reply_without_mention word
      end

      route /^flip\s(.*)$/, :flip, command: false,
        help: { "flip [message]" => "əɓɐssəɯ" }
      def flip(response)
        response.reply response.matches[0][0].flip
      end

      route /(つらい|ねむい)$/, :nena, command: false
      def nena(response)
        return if rand(3) == 0
        response.reply "ねな U ˘ω˘)"
      end

      route /しのう$/, :shino, command: false
      def shino(response)
        return if rand(3) == 0
        response.reply "いきよう U ˘ω˘)"
      end

      route /(はやい|かわいい|#承認|いぬよ|いぬ)$/, :hokuhoku, command: false
      def hokuhoku(response)
        return if rand(3) == 0
        response.reply_without_mention "ﾎｸﾎｸ"
      end

      route /\( ?˘ω˘\)\"?/, :suya, command: false # " this comment is workaround for sublime text syntax highlighting
      def suya(response)
        return if rand(2) == 0
        response.reply response.matches[0]
      end

      route /^tori\s+(\S.*)+/, :tori, command: false,
        help: { "tori [message]" => "( ⁰⊖⁰)/)[ message ]/)" }
      def tori(response)
        word = response.matches[0][0]
        response.reply_without_mention "( ⁰⊖⁰)/)[ #{word} ]/)"
      end

      route /(やぁ|やあ|ヤア|ヤァ)(!|！)?/, :yah_yah, command: true
      def yah_yah(response)
        yah = response.matches[0]
        response.reply "#{yah[0]}#{yah[1]}" * (response.matches.length + 1)
      end

    end
    Lita.register_handler(Pebbles)
  end
end
