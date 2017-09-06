var Body = React.createClass({
    getInitialState() {
        return { tweets: [] }
    },


    componentDidMount() {
        $.getJSON('/api/v1/tweets.json', (response) => { this.setState({ tweets: response }) });
    },


    handleSubmit(tweet) {
        var newState = this.state.tweets.concat(tweet);
        this.setState({ tweets: newState })
    },



    render() {
        return (
            <div>
                <EnterUser handleSubmit={this.handleSubmit}/>
                <AllTweets  tweets={this.state.tweets}  handleDelete={this.handleDelete} onUpdate={this.handleUpdate}/>
            </div>
        )
    }
});