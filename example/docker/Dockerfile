FROM node:14-alpine as assets-builder
RUN mkdir -p /app
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY webpack.config.js ./
COPY app/javascript ./app/javascript
RUN NODE_ENV=production ./node_modules/.bin/webpack

FROM ruby:3.0
ENV RAILS_ENV production
RUN mkdir -p /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle config set --local deployment 'true'
RUN bundle config set --local without 'development test'
RUN bundle install -j4
COPY . /app
COPY --from=assets-builder /app/public/packs ./public/packs

CMD ["bundle", "exec", "rails", "server"]
