# faker-ja

fakerを日本向けに拡張する

## インストール

Gemfile

    gem 'faker-ja', :guthub => "xiaotuanzi/faker-ja"

その後、bundleコマンドでインストールする

    $ bundle install

## 使い方

    require "faker-ja"

    Faker::Config.locale = "ja"

    name = Faker::Name.name              # => "田中 一郎"
    name.yomi                            # => "たなか いちろう"

    first_name = Faker::Name.first_name  # => "一郎"
    first_name.yomi                      # => "いちろう"

    last_name = Faker::Name.first_name   # => "田中"
    last_name.yomi                       # => "たなか"
