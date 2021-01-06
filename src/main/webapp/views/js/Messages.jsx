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
    let srcProfile = 'views/images/avatar-default.png';
    if (props.currentId != props.message.senderId) {
        kind = "replies";
        if (props.withUserProfile != ''){
            srcProfile = 'avatar/' + props.withUserProfile;
        }
    } else {
        kind = "sent";
        if (props.currentUserProfile != ''){
            srcProfile = 'avatar/' + props.currentUserProfile;
        }
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