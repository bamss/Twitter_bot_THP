require 'twitter'

require 'dotenv'
Dotenv.load

client = Twitter::REST::Client.new do |config|
   config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
   config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
   config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
   config.access_token_secret = ENV["TWITTER_ACCES_TOKEN_SECRET"]
 end

 @client = client

 def folow
    @client.search("#bonjour_monde", result_type: 'recent').take(20).each do |tweet|
        @client.follow(tweet.user.screen_name)
    end
 end