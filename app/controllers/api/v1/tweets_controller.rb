class Api::V1::TweetsController < Api::V1::BaseController

  def index
    render nothing: true
  end

  def create
    user_name = TwitterService.verify_and_return_username(params[:user][:name])
    service_tweets = Tweet.get_tweets(user_name)

    if (service_tweets.key?("error") || service_tweets.key?("errors") || service_tweets.parsed_response.empty?)
      tweets = {tweet_text: "No Tweets Were Found For #{user_name}", id: 1}
    else
      user = User.find_or_create_by(username: user_name)
      Tweet.format_tweets_for_response(service_tweets, user)
      tweets = Tweet.where(user_id: user.id).order(tweet_created_at: :desc ).last(10)
    end

    respond_with tweets, json: tweets
  end

  private

  def tweet_params
    params.require(:tweet).permit(:tweet_text)
  end
end