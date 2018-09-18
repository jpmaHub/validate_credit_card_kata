FROM ruby:2.5.1-alpine3.7
RUN apk --no-cache add postgresql-dev postgresql-libs postgresql-client less

WORKDIR /validate_credit_card
COPY Gemfile ./
COPY Gemfile.lock ./
RUN apk --no-cache add alpine-sdk && bundle install && apk del alpine-sdk

EXPOSE 4567

ADD . /validate_credit_card

CMD ["/app/bin/start.sh"]
