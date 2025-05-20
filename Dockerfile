# #103:RailsのDockerfile
# Rubyのイメージをどう探すのか：目的に合わせる。
# また、Gemfileに書いたrailsのバージョンに合わせて、FROM句のtagのバージョンを決める。
# FROM ruby:2.5  # 別にエラーを解決してくれた受講生の人に合わせてみる↓
# FROM ruby:2.7
# FROM ruby:3.3
FROM ruby:3.2
# FROM ruby:latest←これはやめておく
# 今回はコピペするが、最初は↓のRUNに何を書いていいかわからない状態のはず→エラーが出る度に、パッケージを都度調べて追加していくのが普通。その後にエラーが出なくなったら、RUNをひとまとめにしてLayer数を減らす！
# RUN apt-get install -y xxx
# RUN apt-get install -y yyy
# RUN apt-get install -y zzz
# RUN apt-get install -y xyz
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    postgresql-client \
    vim \
    npm
    # yarn
# WORKDIRは、存在しなければコンテナに作ってくれる
WORKDIR /product_register
# Gemfile.lockは、Gemfileを使ってRubyのパッケージをインストールするが、実際にインストールされたGemのバージョンと情報を記録するためのファイル！必要！
# 今回はRailsなので覚えたり深堀りしなくてよいが、他のパッケージでも(Djangoでも)、使う場合は「このような作業が必要になる」ということを覚えておく！
# ★↓複数のファイルをCOPYする場合は、以下のように「/」が必要！
COPY Gemfile Gemfile.lock /product_register/
RUN bundle install