FROM okteto/desk:0.1.4
COPY . /
RUN yarn install
RUN bundle install
RUN rails db:migrate
RUN rails db:seed
CMD [ "rails", "s" ]