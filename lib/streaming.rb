require 'twitter'

require 'dotenv'
Dotenv.load

@client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
    config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
    config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
    config.access_token_secret = ENV["TWITTER_ACCES_TOKEN_SECRET"]
  end
streaming = Twitter::Streaming::Client.new do |config|
    config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
    config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
    config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
    config.access_token_secret = ENV["TWITTER_ACCES_TOKEN_SECRET"]
  end


  @streaming = streaming

  def live
    @streaming.filter(track: "#bonjour_monde") do |tweet|
        puts tweet.text
        @client.fav(tweet)
        @client.follow(tweet.user.screen_name)
      end
  end
live