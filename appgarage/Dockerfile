FROM okteto/desk:0.1.4
WORKDIR /usr/src/app

COPY package.json .
COPY yarn.lock .
RUN yarn install

COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install

COPY . .

RUN bundle exec rails assets:precompile
RUN bundle exec rails webpacker:compile

CMD ["sh", "-c", "rails db:migrate && rails db:seed && rails server"]