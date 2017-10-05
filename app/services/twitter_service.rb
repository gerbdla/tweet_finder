require "httparty"
class TwitterService

  BASE_URL = 'https://api.twitter.com'.freeze
  DEFAULT_TWEETS_PER_REQUEST = 20
  MAX_TWEETS_PER_REQUEST = 200
  CONSUMER_KEY = "Dx3POqlArictHgx1I5KpryKW6"
  CONSUMER_SECRET = "FQNdmQswpIBKrfiKwLL2877WLJLrvEEOzIMoR8gmtoEWRMCB9o"

  def self.get_tweets_for(username)
    credentials = Base64.encode64("#{CONSUMER_KEY}:#{CONSUMER_SECRET}").gsub("\n", '')
    url = "https://api.twitter.com/oauth2/token"
    body = "grant_type=client_credentials"
    headers = {
        "Authorization" => "Basic #{credentials}",
        "Content-Type" => "application/x-www-form-urlencoded;charset=UTF-8"
    }

    response = HTTParty.post(url, body: body, headers: headers)
    bearer_token = JSON.parse(response.body)['access_token']

    api_auth_header = {"Authorization" => "Bearer #{bearer_token}"}
    url = "https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=#{username}&count=10"

    format_response(HTTParty.get(url, headers: api_auth_header))

  end

  def self.format_response(response)
      response
  end

  def self.verify_and_return_username(username)

      if username.start_with?('@')
        return username
      else
        return "@#{username}"
      end

  end

end