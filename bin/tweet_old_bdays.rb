#!/usr/bin/env ruby
# coding: utf-8
require_relative "../config/environment"

include Rails.application.routes.url_helpers

Birthday.all.each do |birthday|
  Twitter.update(birthday.twitter_message + " #{birthday_url(birthday, host: 'birfday.me')}")
end

puts 'ding!'