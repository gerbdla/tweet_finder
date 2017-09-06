class Api::V1::TweetsController < Api::V1::BaseController
  def index
    respond_with ""
  end

  def create
    service_tweets = TwitterService.get_tweets_for(params[:user][:name])

    if service_tweets.count == 0
      tweets = {tweet_text: "No Tweets Were Found For #{params[:user][:name]}", id: 1}
    else

      service_tweets.each do |tweet|
        single_tweet = Tweet.where(tweet_id: tweet["id"])
        if single_tweet.count == 0 || !tweets[tweet_text: "No Tweets Were Found"]
          tweet = Tweet.new(tweet_text: tweet["text"], tweet_id: tweet["id"])
          tweet.user = params[:user][:name]
          tweet.save
        end
        tweets = Tweet.user.where(name: params[:user][:name]).last(10)
      end
    end


    respond_with tweets, json: tweets
  end

  private

  def item_params
    params.require(:item).permit(:id, :tweet_text)
  end
end