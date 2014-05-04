module Lita
  class Message
    def reply(*strings)
      if Lita.config.robot.adapter == :twitter
        reply_with_mention(*strings)
      else
        reply_without_mention(*strings)
      end
    end

    def reply_without_mention(*strings)
      @robot.send_messages(source, *strings)
    end
  end
end
