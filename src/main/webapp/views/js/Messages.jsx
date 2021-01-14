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
        if (props.withUserProfile != '') {
            srcProfile = 'avatar/' + props.withUserProfile;
        }
    } else {
        kind = "sent";
        if (props.currentUserProfile != '') {
            srcProfile = 'avatar/' + props.currentUserProfile;
        }
    }

    if (props.message.type == "text") {
        return (
            <li className={kind}>
                <img src={srcProfile} />
                <p>{props.message.content}</p>
                <Error error={props.message.isError} />
            </li>
        );
    } else if (props.message.type == "image") {
        let nameFileAfterUpload = props.message.content.substring (props.message.content.indexOf("/"),props.message.content.length);               
        let srcImage = 'FileMessage/' + nameFileAfterUpload;
        return (
            <li className={kind}>
                <img src={srcProfile} />
                <a href={srcImage} className="image-send">
                    <img src={srcImage} alt="" className="image-message" />
                </a>
                <Error error={props.message.isError} />
            </li>
        );
    } else {
        let nameFileBeforeUpload = props.message.content.substring (0,props.message.content.indexOf("/"));
        let nameFileAfterUpload = props.message.content.substring (props.message.content.indexOf("/"),props.message.content.length);
        let srcFile = 'FileMessage/' + nameFileAfterUpload;
        return (
            <li className={kind}>
                <img src={srcProfile} />
                <a href={srcFile} className="file-send" download={nameFileBeforeUpload}><i class="fa fa-file" aria-hidden="true"></i>{nameFileBeforeUpload}</a>
                <Error error={props.message.isError} />
            </li>
        );
    }
}

function Error(props) {
    if (props.error) {
        return (
            <div>
                <div className="clearfix"></div>
                <span className="text-danger">
                    <i class="fa fa-warning" aria-hidden="true"></i>
          Can't send message
        </span>
            </div>
        );
    } else {
        return <div className="clearfix"></div>;
    }
}