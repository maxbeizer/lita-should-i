module Lita
  module Handlers
    class ShouldI < Handler
      route(/\Ashould I (.+) or (.+)\?\z/, :should_i, command: true, help: {
        "robot should I _firstthing_ or _lastthing_ ?" => "Robot chooses _firstthing_ or _lastthing_"
      })

      def should_i(response)
        option = choose_option response.matches.first
        response.reply "You should #{option}"
      end

      private
      def choose_option(matches)
        matches.sample
      end
    end


    Lita.register_handler(ShouldI)
  end
end
