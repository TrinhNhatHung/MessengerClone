class ListContact extends React.Component {
    constructor(props){
        super(props)
    }

    render(){
        return (
            <ul>
                {this.props.contacts.map(contact => {
                    return <Contact contact= {contact} withId= {this.props.withId} onlineUsers ={this.props.onlineUsers}/>
                })}
            </ul>
        );
    }
}

function Contact (props){
    let kind = props.contact.kindLastMessage;
    let msg = props.contact.lastMessage;
    if (props.contact.typeLastMessage == 'file'){
         msg = props.contact.lastMessage.substring (0,props.contact.lastMessage.indexOf("/"));
    }
    let style = {color: 'gray'}
    if (kind == "SENT"){
        msg = "You: " + msg;
        if (props.contact.typeLastMessage == 'image'){
           msg = "You has sent an image ";
        }
    } else {
         if (props.contact.typeLastMessage == 'image'){
            msg = "has sent you an image ";
         }
         if (props.contact.statusMessage == "SENT" && props.withId != props.contact.user.id){
             style = {color: 'white',fontWeight:'bold'}
         }
    }

    let src = "views/images/avatar-default.png"
    if (props.contact.user.profile != undefined ){
        src = 'avatar/' + props.contact.user.profile;
    }

    let status = "contact-status";
    if (props.onlineUsers.includes(props.contact.user.id)){
      status += " online";
    }

  let href = "/webchat/home" + "?with=" + props.contact.user.id;

  let hasActive = "contact";
  if (props.withId == props.contact.user.id) {
    hasActive += " active";
  }

  return (
    <li className={hasActive}>
      <a href={href}>
        <div className="wrap">
          <span className={status}></span>
          <img src={src} />
          <div className="meta">
            <p className="name">{props.contact.user.username}</p>
            <p className="preview" style={style}>
              {msg}
            </p>
          </div>
        </div>
      </a>
    </li>
  );
}