<%@page import="utils.ReadProperties"%>
<%@page import="java.util.Properties"%>
<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
    User withUser = (User)request.getAttribute("withUser");
    
	String title = "Messenger";
    if (withUser != null) { 
    	title = withUser.getUsername() + " | " + title;
    	session.setAttribute("withUser", withUser.getId());
    }
    
    long messageUnread = (long)request.getAttribute("messageUnread");
    String lastNameUnread = (String)request.getAttribute("lastNameUnread");
    if (messageUnread != 0) {
    	title = "(" + messageUnread + ") " + title; 
    }
%>
<head>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%=title %></title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css'>
    <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.2/css/font-awesome.min.css'>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

    <link rel="shortcut icon" type="image/x-icon" href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" />
    <link rel="mask-icon" type="" href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" />
    <link rel="canonical" href="https://codepen.io/emilcarlsson/pen/ZOQZaV?limit=all&page=74&q=contact+" />
    <link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700,300' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="views/css/home.css">

    <script src="https://unpkg.com/react@17/umd/react.production.min.js" crossorigin></script>
    <script src="https://unpkg.com/react-dom@17/umd/react-dom.production.min.js" crossorigin></script>
    <script src="https://unpkg.com/babel-standalone@6/babel.min.js"></script>
    <script src="views/js/ListContact.jsx" type="text/babel"></script>
    <script src="views/js/Messages.jsx" type="text/babel"></script>
    <script src="views/js/SharedFile.jsx" type="text/babel"></script>
    <script src="views/js/SharedPhoto.jsx" type="text/babel"></script>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.css" integrity="sha512-WEQNv9d3+sqyHjrqUZobDhFARZDko2wpWdfcpv44lsypsSuMO0kHGd3MQ8rrsBn/Qa39VojphdU6CMkpJUmDVw==" crossorigin="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.js" integrity="sha512-C1zvdb9R55RAkl6xCLTPt+Wmcz6s+ccOvcr6G57lbm8M2fbgn2SUjUJbQ13fEyjuLViwe97uJvwa1EUf4F1Akw==" crossorigin="anonymous"></script>
</head>
<body>
<%
     String username = (String)request.getSession().getAttribute("username");	  
%>
<div class="frame">
        <div class="sidepanel">
            <div class="profile">
                <div class="wrap">
                <%
                User currentUser = (User) request.getAttribute("currentUser");
				String currentUserProfile = "views/images/avatar-default.png";
				if (currentUser.getProfile() != null) {
					currentUserProfile = "avatar/" + currentUser.getProfile();
				}
                %>
                    <img class="profile-img" src="<%=currentUserProfile %>" alt="">
                    <p>${currentUser.username}</p>
                    <i class="fa fa-chevron-down expand-button" aria-hidden="true"></i>
                    <div class="expanded">
                        <label for="email"><i class="fa fa-envelope fa-fw" aria-hidden="true"></i></label>
                        <input name="email" type="text" value="${currentUser.email}" spellcheck="false" disabled>
                        <label for="phone"><i class="fa fa-phone fa-fw" aria-hidden="true"></i></label>
                        <input name="phone" type="text" value="${currentUser.phone}" spellcheck="false" disabled>
                    </div>
                </div>
            </div>
            <div class="search">
                <label for="search-area"><i class="fa fa-search" aria-hidden="true"></i></label>
                <input type="text" name="search-area" placeholder="Search contacts...">
            </div>
            <div class="contacts" id="contacts">

            </div>
            <div class="bottom-bar">
                <button class="addcontact">
                    <a href="<%=request.getContextPath()%>/addContact">
                    	<i class="fa fa-user-plus fa-fw" aria-hidden="true"></i>
                        <span>Add contact</span>
                    </a>
                </button>
                <button class="settings">
                     <a href="<%=request.getContextPath()%>/setting">
                        <i class="fa fa-cog fa-fw" aria-hidden="true"></i>
                        <span>Settings</span>
                    </a> 
                </button>
            </div>
        </div>
        <div class="content" id="content">
            <div class="contact-profile">
                <%
                	 String withUserName = "";
                	 String withUserProfile = "";               	
                	 if (withUser != null){
                        withUserProfile = "views/images/avatar-default.png";
                       	if (withUser.getProfile() != null){
                       		withUserProfile = "avatar/" + withUser.getProfile();
                       	}
                       	withUserName = withUser.getUsername();
                	 }
                %>
                <img src="<%=withUserProfile%>" alt="">
                <p><%=withUserName%></p>
            </div>
            <div class="messages image-link" id="messages">

            </div>
            <div class="message-input">
                <div class="wrap">
                    <input name="text" type="text" placeholder="Write your message..." spellcheck="false">                 
                    <form id="message-form" action="<%=request.getContextPath()%>/send-message" method="post" enctype="multipart/form-data">
                        <i class="fa fa-paperclip attachment attachment-file" aria-hidden="true"></i>
                        <input name="file" class="input-file" type="file" multiple>                                       
                    </form>
                    <button class="submit"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
                </div>
            </div>
        </div>
        <div class="detail-contact">
            <div class="wrap">
                <span class="status online"></span>
                <img src="<%=withUserProfile%>" alt="" class="with-user-avatar">
                <p class="name"><%=withUserName%></p>
                <p class="status-active">Online</p>
            </div>
            <div class="about">
                <ul class="list-group">

                    <li class="list-group-item expand-btn-info">
                        Info
                        <i class="fa fa-chevron-down" aria-hidden="true"></i>
                    </li>
                    <div class="expanded-info none">
                        <div class="item">
                            <i class="fa fa-intersex" aria-hidden="true"></i>
                            <p>${withUser.gender}</p>
                        </div>
                        <div class="item">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                            <p>${withUser.email}</p>
                        </div>
                        <div class="item">
                            <i class="fa fa-phone" aria-hidden="true"></i>
                            <p>${withUser.phone}</p>
                        </div>
                    </div>


                    <li class="list-group-item expand-btn-file">
                        Shared file
                        <i class="fa fa-chevron-down" aria-hidden="true"></i>
                    </li>
                    <div class="expanded-file none" id="shared-file">
                        
                    </div>
                    
                    
                    <li class="list-group-item expand-btn-photo">
                        Shared photo
                        <i class="fa fa-chevron-down" aria-hidden="true"></i>
                    </li>
                    <div class="expanded-photo none" id="shared-photo">
                       
                    </div>
                </ul>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="views/js/home.js"></script>
    <script>
	    if (<%=messageUnread%> != 0){
	    	var toggle = true;
	    	setInterval(function(){ 
	    		if (toggle == true) {
	    			document.title = '<%=lastNameUnread%> has messaged you';
	    			toggle = false;
	    		} else {
	    			document.title = '<%=title%>';
	    			toggle = true;
	    		}
	    	}, 1000);
	    }
        window.onbeforeunload = function() {
        	localStorage.setItem("inputMessage", $('.message-input input').val());
        }
        
        window.onload = function() {
            let messageInput = localStorage.getItem("inputMessage");
            let messageNeededSend= localStorage.getItem("MessageNeededSend");
            
            
            	setTimeout(function(){
                    if ('<%=session.getAttribute("FileNeededSend")%>' != 'null'){
                    	sendMessage ('<%=session.getAttribute("FileNeededSend")%>');
                    	<%
                    		session.removeAttribute("FileNeededSend");
                    	%>
                    }
                    
            		if (messageNeededSend != null) {
            		    sendMessage (messageNeededSend);
            	 	    localStorage.removeItem("MessageNeededSend");           	
                    } else {
                    	$('.message-input input').val(messageInput);
                    }
                    localStorage.removeItem("inputMessage");
                }, 300);
            	                       
        }        
        
    </script>
    
    <script>
		var listContactJson = '${listItemChats}';
		var listContact = JSON.parse(listContactJson);
		
		if ('<%=withUser%>' == 'null'){
			$('#content').addClass('disabled');
		};		
		var listMessagesJson = '${listUserChats}';
		var listMessages = JSON.parse(listMessagesJson);
		
		var listSharedPhoto = listMessages.filter ((message)=> {
			if (message.type == 'image'){
				return true;
			}
			return false;
		});
		
		var listSharedFile = listMessages.filter ((message)=> {
			if (message.type == 'file'){
				return true;
			}
			return false;
		});
		
		const currentUserProfile = '${currentUser.profile}';
		const withUserProfile = '${withUser.profile}';
		const currentId = ${currentUser.id};
		const withId = <%= withUser== null ? 0 : withUser.getId()%>;
	</script>
	
    <script type="text/babel">
		  $('.search input').on('input', function(event) { 
                 let textSearch = $(event.target).val();
                 textSearch = textSearch.trim(); 
				 let listContactSearch = listContact.filter(function(contact) { 
							let username = contact.user.username; 
							if (username.includes(textSearch)) { 
									return true; 
							}
				 }); 
         		 ReactDOM.render( <ListContact contacts={listContactSearch} withId={withId} onlineUsers={onlineUsers} />, document.getElementById("contacts")); 
         });
	
		ReactDOM.render(
        <SharedFile files={listSharedFile}/>, document.getElementById("shared-file")); 

		ReactDOM.render(
        <SharedPhoto photos={listSharedPhoto}/>, document.getElementById("shared-photo"));   		
     
         ReactDOM.render(
        <Messages messages={listMessages} currentUserProfile={currentUserProfile} withUserProfile={withUserProfile} currentId={currentId} withId={withId} />, document.getElementById("messages"));
    </script>
    
    <%
    	Properties properties = ReadProperties.getProperties();
    	String domain = properties.getProperty("domain");
    	String port = properties.getProperty("port");
    	String folder = properties.getProperty("folder");
    %>
    
    <script type="text/babel">
    	var websocket = new WebSocket("ws://<%=domain%>:<%=port%>/<%=folder%>/server");
    	websocket.onopen = function() {
			processOpen();
		};
		websocket.onmessage = function(message) {
			processMessage(message);
		};
		websocket.onclose = function() {
			processClose();
		};
		websocket.onerror = function() {
			processError();
		};
		function processOpen() {
			let msgObj ={
				 kind : "open",
				 session : ${currentUser.id}
			};
			let message = JSON.stringify(msgObj);
			sendMessage(message);
		}
		
		var onlineUsers = [];
		function processMessage(message) {
			let messageObj = JSON.parse(message.data);
			if (messageObj.notification == undefined){
				onlineUsers = messageObj;	
				let textSearch = $('.search input').val();
                textSearch = textSearch.trim() ; 
				let listContactSearch = listContact.filter(function(contact) { 
							let username = contact.user.username; 
							if (username.includes(textSearch)) { 
									return true; 
							}
				}); 
         		 ReactDOM.render( <ListContact contacts={listContactSearch} withId={withId} onlineUsers={onlineUsers} />, document.getElementById("contacts")); 
				 if (!onlineUsers.includes(withId)){
				 	  $('.detail-contact .wrap .status-active').html('Offline');
                      $('.detail-contact .wrap .status').removeClass('online');
				 } else {
				 	  $('.detail-contact .wrap .status-active').html('Online');
                      $('.detail-contact .wrap .status').addClass('online');
				 }
			}
			
			if (messageObj.notification == 'hasNewMessage' || messageObj.notification == 'sendSuccessfull'){
				location.reload();
			} else if (messageObj.notification == 'sendFail') {
				let messageError = messageObj.content;
			    listMessages.push({
					senderId : '${currentUser.id}',
					receiverId : '${withUser.id}',
					content : messageError,
		            isError: true
				});
				ReactDOM.render(
                <Messages messages={listMessages} currentUserProfile={currentUserProfile} withUserProfile={withUserProfile} currentId={currentId} withId={withId} />, document.getElementById("messages"));
				$("#messages").animate({
                    scrollTop: $('#messages').prop("scrollHeight")
                }, 1);
			}
			
		}				
		function processClose() {
			
		}
		function processError() {
			
		}
		function sendMessage(message) {
			if (typeof websocket != 'undefined'
					&& websocket.readyState == WebSocket.OPEN) {
				websocket.send(message);
			}
		}
		
		function getMessage (){
			let content = $(".message-input input").val();
			if ($.trim(content) == '') {
                return undefined;
            }
			let now = new Date();
			let nowMillis = now.getTime();
			let msgObj = {
				 kind : "message",
				 usersChat : {
					 senderId : '${currentUser.id}',
					 receiverId : '${withUser.id}',
					 content : content,
					 time : nowMillis,
					 type : 'text'
				 }
			}
			let message = JSON.stringify(msgObj);
			return message;
		}
		
		function hasFileAttach (){
			if ($('.input-file')[0].files.length > 0) {
			     return true;
			}			
			
			return false;
		}
		
		 $('.submit').click(function() {	
			   let message = getMessage ();
			   if (hasFileAttach() == true){
                    if (message != undefined) {
						localStorage.setItem("MessageNeededSend", message);
					}
			   		$('#message-form').trigger('submit');
			   } else {
			   		if (message != undefined) {
	                    sendMessage(message);
				        $(".message-input input").val('');
			         }
			   }					 
	     });
		 
		 $(window).on('keydown', function(e) {
	            if (e.which == 13) {	            	
	            	let message = getMessage ();
			        if (hasFileAttach() == true){
                       if (message != undefined) {
						  localStorage.setItem("MessageNeededSend", message);
					   }
			   		   $('#message-form').trigger('submit');
			        } else {
			   		   if (message != undefined) {
	                      sendMessage(message);
				          $(".message-input input").val('');
			           }
			        }	
				
	                return false;
	            }
	     });	
    </script>
</body>
</html>