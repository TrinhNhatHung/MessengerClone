class ListOtherUser extends React.Component {
    constructor(props) {
        super(props)
    }

    render (){
        return (
            <div className="people-nearby">
                {
                    this.props.users.map((user) => {
                       return <User user={user}/>
                    })
                }
            </div>
        );
    }
}

function User (props){
    let srcProfile = "views/images/avatar-default.png";
    if (props.user.profile != undefined){
        srcProfile = "avatar/" + props.user.profile;
    }
    let href = "/webchat/home" + "?with=" + props.user.id;
    return (
        <div className="nearby-user">
            <div className="row">
                            <div className="col-md-2 col-sm-2">
                                <img src={srcProfile} alt="user" className="profile-photo-lg"/>
                            </div>
                            <div className="col-md-7 col-sm-7">
                                <h5><a href="#" className="profile-link">{props.user.username}</a></h5>
                                <p>{props.user.email}</p>
                                <p className="text-muted">{props.user.phone}</p>
                            </div>
                            <div className="col-md-3 col-sm-3">
                                <a href={href}>
                                    <button className="btn btn-primary pull-right">Send message</button>
                                </a> 
                            </div>
            </div>
        </div>
    );
}