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
                    <input ref='name' placeholder='Enter Screen Name' />
                    <button onClick={this.handleClick}>Show Me The Tweets!</button>
                </div>

        )
    }
});
