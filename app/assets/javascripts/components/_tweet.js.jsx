var Tweet = React.createClass({
    getInitialState() {
        return {editable: false}
    },
    handleEdit() {
        if(this.state.editable) {
            var tweet_text = this.refs.tweet_text.value;
            var tweet = {id: id , tweet_text: tweet_text };
            this.props.handleUpdate(tweet);

        }
        this.setState({ editable: !this.state.editable })
    },

    render() {
        var tweet_text = <h3>{this.props.tweet.tweet_text}</h3>;

        return (
            <div>
                {tweet_text}

            </div>
        )
    }
});