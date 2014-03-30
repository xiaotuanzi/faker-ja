module Faker
  module Japanese
    class Name < Base

      class << self
        def first_name; fetch(:first_name); end
        def last_name;  fetch(:last_name);  end
        def name
          ln, fn = fetch(:last_name), fetch(:first_name)
          KanjiString.new("#{ln} #{fn}", "#{ln.yomi} #{fn.yomi}")
        end
      end

      replace_method Faker::Name, :first_name
      replace_method Faker::Name, :last_name
      replace_method Faker::Name, :name
#      replace_method Faker::Name, :yomi
    end

 end
end
