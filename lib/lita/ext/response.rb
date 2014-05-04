module Lita
  class Response
    def_delegators :message, :reply_without_mention
  end
end