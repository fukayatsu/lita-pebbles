module Lita
  module Handlers
    class Sample < Handler

      route /^sample (.+)/, :sample, command: false,
        help: { "sample [foo] [bar] [baz]" => "[foo] に決めた！" }
      def sample(response)
        list = response.matches[0][0].split
        response.reply "#{list.sample} に決めた！"
      end
    end
    Lita.register_handler(Sample)
  end
end
