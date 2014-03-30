require "faker"

module Faker
  module Japanese
    HERE = File.expand_path("#{__FILE__}/..")

    class KanjiString < String
      attr_accessor :yomi
      def initialize(kanji, yomi)
        super(kanji)
        @yomi = yomi
      end
    end

    class Base
      class << self
        def load_fakedata(klass)
          yamlfile = "#{HERE}/faker-ja/" + klass.to_s.split("::").last.downcase + ".yml"
          if File.readable?(yamlfile)
            YAML.load_file(yamlfile).inject({}) do |result, key_elements|
              key, elements, = key_elements
              result.update key => elements.map! { |e| KanjiString.new(*e) }
            end
          else
            nil
          end
        end

        def inherited(klass)
          klass.class_variable_set "@@fakedata", load_fakedata(klass)
        end

        def fetch(key)
          d = self.class_variable_get("@@fakedata")[key.to_s]
          d[rand(d.length)]
        end

        def replace_method(klass, name)
          original_method = klass.method(name)
          japanese_method = method(name)
          klass.singleton_class.send :define_method, name, -> {
            Faker::Config.locale == "ja" ? japanese_method.call : original_method.call
          }
        end
      end
    end
  end
end

Dir.glob("#{File.dirname(__FILE__)}/faker-ja/*.rb") do |file|
  require file
end
