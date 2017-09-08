class Tweet < ApplicationRecord
  belongs_to :user


  def self.get_tweets(params)
    TwitterService.get_tweets_for(params[:user][:name])
  end

  def self.format_tweets_for_response(service_tweets, user)
    service_tweets.each do |tweet|
      single_tweet = Tweet.where(tweet_id: tweet["id"]).all
      if single_tweet.count == 0
        tweet = Tweet.new(tweet_text: tweet["text"], tweet_id: tweet["id"])
        tweet.user = user
        tweet.save
      end
    end

  end
end
