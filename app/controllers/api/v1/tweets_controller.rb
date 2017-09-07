class Api::V1::TweetsController < Api::V1::BaseController
  def index
    respond_with ""
  end

  def create
    service_tweets = TwitterService.get_tweets_for(params[:user][:name])
     puts service_tweets
    if service_tweets.key?(:error)
      tweets = {tweet_text: "No Tweets Were Found For #{params[:user][:name]}", id: 1}
    else
      user = User.where(username: params[:user][:name]).first
      if !user
       user = User.create(username: params[:user][:name])
      end

      service_tweets.each do |tweet|
        single_tweet = Tweet.where(tweet_id: tweet["id"]).all
        puts "this"
        puts single_tweet.count
        if single_tweet.count == 0
          tweet = Tweet.new(tweet_text: tweet["text"], tweet_id: tweet["id"])
          tweet.user = user
          tweet.save
        end
        tweets = Tweet.where(user_id: user.id).last(10)
      end
    end


    respond_with tweets, json: tweets
  end

  private

  def item_params
    params.require(:item).permit(:id, :tweet_text)
  end
end