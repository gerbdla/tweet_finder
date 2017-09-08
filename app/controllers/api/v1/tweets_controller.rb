class Api::V1::TweetsController < Api::V1::BaseController
  def index
    respond_with ""
  end

  def create
    service_tweets = Tweet.get_tweets(params)
   puts "This is it"
    puts service_tweets.inspect
    if service_tweets.key?("error") || service_tweets.key?("errors") || service_tweets.parsed_response.empty?
      tweets = {tweet_text: "No Tweets Were Found For #{params[:user][:name]}", id: 1}
    else
      user = User.where(username: params[:user][:name]).first

      if !user
       user = User.create(username: params[:user][:name])
      end

       Tweet.format_tweets_for_response(service_tweets, user)

       tweets = Tweet.where(user_id: user.id).last(10)
      end

    respond_with tweets, json: tweets
  end

  private

  def item_params
    params.require(:tweet).permit(:id, :tweet_text)
  end
end