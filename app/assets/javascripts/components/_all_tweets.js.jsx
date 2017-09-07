var AllTweets = React.createClass({


    render() {
             var tweets = this.props.tweets.map((tweet) => {
                return (
                    <div key={tweet.id}>
                        <Tweet tweet={tweet} />
                    </div>
                )
            });

        return(
            <div>
                {tweets}
            </div>
        )
    }
});