module Lita
  module Handlers
    class Kansai < Handler
      route /(.+)やろか(?:？|\?)*?$/, :seyaroka, command: false
      route /(.+)やで(?:？|\?)*?$/,   :seyade,   command: false
      route /(.+)やな(?:？|\?)*?$/,   :seyana,   command: false

      def seyaroka(response)
        return if rand(2) == 0
        message = ['せやで', 'せやな', 'せやせや', 'ちゃうんちゃう？', 'ちゃうで'].sample
        response.reply message
      end

      def seyade(response)
        return if rand(2) == 0
        message = ['せやろか', 'せやな', 'せやせや'].sample
        response.reply message
      end

      def seyana(response)
        return if rand(2) == 0
        message = ['せやろか', 'せやな', 'せやせや'].sample
        response.reply message
      end

    end
    Lita.register_handler(Kansai)
  end
end