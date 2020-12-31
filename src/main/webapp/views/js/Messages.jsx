class Messages extends React.Component {
    constructor(props) {
        super(props)
    }
    render() {
        return (
            <ul>
                {
                    this.props.messages.map(message => {
                        return <Message message={message} currentUserProfile={this.props.currentUserProfile}
                            withUserProfile={this.props.withUserProfile} currentId={this.props.currentId}
                            withId={this.props.withId}
                        />
                    })
                }
            </ul>
        );
    }
}

function Message(props) {
    let kind = "sent";
    let srcProfile = props.currentUserProfile;
    if (props.currentId != props.message.senderId) {
        kind = "replies";
        srcProfile = props.withUserProfile;
    }
    if (srcProfile == '') {
        srcProfile = 'views/images/avatar-default.png'
    }
    if (props.message.isError) {
        return (
            <li className={kind}>
                <img src={srcProfile} />
                <p>{props.message.content}</p>
                <div className="clearfix"></div>
                <span className="text-danger">
                    <i class="fa fa-warning" aria-hidden="true"></i>
                    Can't send message
                </span>
            </li>
        );
    } else {
        return (
            <li className={kind}>
                <img src={srcProfile} />
                <p>{props.message.content}</p>
            </li>
        );
    }
}