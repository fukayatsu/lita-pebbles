require 'json'

module Lita
  module Handlers
    class Misawa < Handler
      route /^misawa/, :misawa, command: false
      def misawa(response)
        response.reply meigens.sample['image']
      end

    private

      def meigens
        return @meigens if @meigens
        spec = Gem::Specification.find_by_name("lita-pebbles")
        meigens_json = File.join(spec.gem_dir, 'config', 'meigens.json')
        @meigens = JSON.parse(File.open(meigens_json).read)
      end
    end
    Lita.register_handler(Misawa)
  end
end