var EnterUser= React.createClass({
    handleClick() {
        var name    = this.refs.name.value;

        $.ajax({
            url: '/api/v1/tweets',
            type: 'POST',
            data: { user: { name: name } },
            success: (name) => {
                this.props.handleSubmit(name);
            }
        });
    },
    render() {
        return (
                <div>
                    <input ref='name' placeholder='Enter the name of the twitter user' />
                    <button onClick={this.handleClick}>Submit</button>
                </div>

        )
    }
});
