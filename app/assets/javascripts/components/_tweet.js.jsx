var Tweet = React.createClass({
    getInitialState() {
        return {editable: false}
    },

    render() {
        var tweet_text = <h3>{this.props.tweet.tweet_text}</h3>;

        return (
            <div class="tweets">
                <table>
                    <td><img src="twitter.png" alt="Twitter Image" height="30" align="middle"/></td><td>{tweet_text}</td>
                </table>

            </div>
        )
    }
});