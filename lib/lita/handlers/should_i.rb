module Lita
  module Handlers
    class ShouldI < Handler
      route(/\Ashould I (.+) or (.+)\?\z/, :should_i, command: true, help: {
        "should I _firstthing_ or _lastthing_ ?" => " Robot chooses _firstthing_ or _lastthing_"
      })

      def should_i(response)
        option = build_response response.matches.first
        response.reply "You should #{option}."
      end

      private
      def build_response(matches)
        transform_person matches.sample
      end

      def transform_person(phrase)
        [
          [/\sme\b/i    , ' you'],
          [/\smine\b/i  , ' yours'],
          [/\smy\b/i    , ' your'],
          [/\syou\b/i   , ' me'],
          [/\syour\b/i  , ' my'],
          [/\syours\b/i , ' mine']
        ]
        .select { |transform| phrase =~ transform.first }
        .map    { |transform| phrase.gsub!(transform.first, transform.last) }
        phrase
      end
    end


    Lita.register_handler(ShouldI)
  end
end
