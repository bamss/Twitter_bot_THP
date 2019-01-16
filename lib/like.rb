
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
 def love
    # i = 0
    # while i < 25
    #     @client.fav("#{"#bonjour_monde"}")
    #     i +=1
    # end
    @client.search("#ux").take(25).each do |tweet|
        @client.fav(tweet)
      end
 end

 love