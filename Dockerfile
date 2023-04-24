FROM ruby:3.2

LABEL "name"="Publish to Rubygems (configurable)"
LABEL "version"="2.0.0"

LABEL "com.github.actions.name"="Publish to Rubygems (configurable)"
LABEL "com.github.actions.icon"="upload"
LABEL "com.github.actions.color"="red"
LABEL "com.github.actions.description"="Publish your gem to Rubygems"

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
