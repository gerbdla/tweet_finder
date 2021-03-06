class Tweet < ApplicationRecord
  belongs_to :user


  def self.get_tweets(username)
    TwitterService.get_tweets_for(username)
  end

  def self.format_tweets_for_response(service_tweets, user)
    service_tweets.each do |tweet|
      single_tweet = Tweet.where(tweet_id: tweet["id"]).all
      if single_tweet.count == 0
        tweet = Tweet.new(tweet_text: tweet["text"], tweet_id: tweet["id"], tweet_created_at: tweet["created_at"])
        tweet.user = user
        tweet.save
      end
    end
  end
end
