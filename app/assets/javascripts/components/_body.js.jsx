var Body = React.createClass({
    getInitialState() {
        return { tweets: [] }
    },


    componentDidMount() {
        $.getJSON('/api/v1/tweets.json', (response) => { this.setState({ tweets: response }) });
    },


    handleSubmit(tweets) {
        this.state.tweets = []
        var newState = this.state.tweets.concat(tweets);
        this.setState({ tweets: newState })
    },

    render() {
        return (
            <div>
                <EnterUser handleSubmit={this.handleSubmit}/>
                <AllTweets  tweets={this.state.tweets}   onUpdate={this.handleUpdate}/>
            </div>
        )
    }
});