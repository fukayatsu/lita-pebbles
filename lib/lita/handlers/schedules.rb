require 'rufus-scheduler'

module Lita
  module Handlers
    class Schedules < Handler
      config :room,              default: nil
      config :should_sleep_at,   default: nil
      config :should_wake_up_at, default: nil

      on :loaded, :init_scheduler
      def init_scheduler(payload)
        return unless config.room

        @scheduler = Rufus::Scheduler.new

        if should_sleep_at = config.should_sleep_at
          @scheduler.cron should_sleep_at do
            robot.trigger(:should_sleep,   room: config.room)
          end
        end

        if should_wake_up_at = config.should_wake_up_at
          @scheduler.cron should_wake_up_at do
            robot.trigger(:should_wake_up,   room: config.room)
          end
        end
      end

      on :should_sleep, :should_sleep
      def should_sleep(payload)
        target = Source.new(room: payload[:room])
        robot.send_message(target, "ねな( ˘ω˘)")
      end

      on :should_wake_up, :should_wake_up
      def should_wake_up(payload)
        target = Source.new(room: payload[:room])
        messages = [
          '₍₍ (̨̡ ˘ω˘)̧̢ ₎₎',
          '( ⁰⊖⁰)',
          '( ˘ω˘)ｸｿﾈﾐ',
          '(◉ω◉)',
          '₍₍ (̨̡ ‾᷄⌂‾᷅)̧̢ ₎₎',
          '起きた |ωΦ)',
          '٩( ˘ω˘ )و',
        ]
        robot.send_message(target, messages.sample)
      end

      private

      def config
        Lita.config.handlers.schedules
      end
    end
    Lita.register_handler(Schedules)
  end
end
