var AllTweets = React.createClass({
    handleDelete(id) {
        this.props.handleDelete(id);
    },

    onUpdate(item) {
        this.props.onUpdate(tweet);
    },

    render() {
            var tweets = this.props.tweets.map((tweet) => {
                console.log(tweet)
                return (
                    <div key={tweet.id}>
                        <Tweet tweet={tweet}
                              handleUpdate={this.onUpdate}/>
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