module Lita
  module Handlers
    class TwitterUtil < Handler
      on :favorited,   :on_favorited
      on :unfavorited, :on_unfavorited
      on :followed,    :on_followed

      def on_favorited(payload)
        return if rand(2) == 0
        # user  = payload[:user]
        # tweet = payload[:tweet]
        target = Source.new(room: 1)
        robot.send_message(target, ['ホクホク', 'ﾎｸﾎｸ', 'hokuhoku', '!?', '！', 'ﾌｫｸﾌｫｸ'].sample)
      end

      def on_unfavorited(payload)
        return if rand(2) == 0
        # user  = payload[:user]
        # tweet = payload[:tweet]
        target = Source.new(room: 1)
        robot.send_message(target, ['!?', '!', 'ｶﾞｰﾝ', '!?', '( ‾᷄⌂‾᷅)', 'にゃーん'].sample)
      end

      def on_followed(payload)
        user  = payload[:user]
        robot.join(user.id.to_i)
      end
    end
    Lita.register_handler(TwitterUtil)
  end
end
