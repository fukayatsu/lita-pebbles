module Lita
  module Handlers
    class Omikuji < Handler
      LOTS = {
        '大吉' => %w(万事好調なり 昇龍のごとし 飛躍の時 良き気運満つ),
        '吉'   => %w(安泰の気運続く 暫く平穏なり),
        '中吉' => %w(気運上昇の時 可なく不可もなし 満願のきざしあり 好調なるも蔭あり),
        '小吉' => %w(気運やや下降の時 波乱のきざしあり 気運高まるきざし 飛躍近し 待ちの時期なり),
        '末吉' => %w(好転のきざしあり やや平穏が続く やや下降のきざし 蔭なくなる 気運切り開く時),
        '凶'   => %w{忍耐の時期なり やや低迷の時 実を結ばぬ時 じっと待つが吉 慎重なるが良し ねな(\ ˘ω˘)},
      }

      route /^omikuji/, :omikuji, command: false
      def omikuji(response)
        response.reply sample_omikuji
      end

    private

      def sample_omikuji(random = Random.new)
        lots     = LOTS.keys
        lot      = lots[random.rand(lots.length)]
        messages = LOTS[lot]
        message  = messages[random.rand(messages.length)]
        [lot, message].join(': ')
      end
    end
    Lita.register_handler(Omikuji)
  end
end
