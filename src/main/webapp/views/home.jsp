<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
                	User currentUser = (User)request.getAttribute("currentUser");
                    String currentUserProfile = currentUser.getProfile();
                	if (currentUserProfile == null){
                		currentUserProfile = "views/images/avatar-default.png";
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
                    <i class="fa fa-user-plus fa-fw" aria-hidden="true"></i>
                    <span>Add contact</span>
                </button>
                <button class="settings">
                     <a href="<%=request.getContextPath()%>/setting">
                        <i class="fa fa-cog fa-fw" aria-hidden="true"></i>
                        <span>Settings</span>
                    </a> 
                </button>
            </div>
        </div>
        <div class="content">
            <div class="contact-profile">
                <%
                	 User withUser = (User)request.getAttribute("withUser");
                     String withUserProfile = withUser.getProfile();
                	if (withUserProfile == null){
                		withUserProfile = "views/images/avatar-default.png";
                	}
                %>
                <img src="<%=withUserProfile%>" alt="">
                <p>${withUser.username}</p>
            </div>
            <div class="messages" id="messages">

            </div>
            <div class="message-input">
                <div class="wrap">
                    <input type="text" placeholder="Write your message..." spellcheck="false">
                    <i class="fa fa-paperclip attachment" aria-hidden="true"></i>
                    <button class="submit"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(".expand-button").click(function() {
            $(".profile").toggleClass("expanded");
            $(".contacts").toggleClass("expanded");
        });
        
        setTimeout(function(){
        	$("#messages").animate({
                scrollTop: $('#messages').prop("scrollHeight")
            }, 1);
        }, 200);
       
        	
           
        window.onbeforeunload = function() {
        	localStorage.setItem("inputMessage", $('.message-input input').val());
        }
        
        window.onload = function() {
            let messageInput = localStorage.getItem("inputMessage");
            if (name !== null) {
            	$('.message-input input').val(messageInput);
            	localStorage.removeItem("inputMessage");
            }
        }
    </script>
    
    <script>
		var listContactJson = '${listItemChats}';
		var listContact = JSON.parse(listContactJson);
		var listMessagesJson = '${listUserChats}';
		var listMessages = JSON.parse(listMessagesJson);
		
		const currentUserProfile = '${currentUser.profile}';
		const withUserProfile = '${withUser.profile}';
		const currentId = ${currentUser.id};
		const withId = ${withUser.id};
	</script>
	
    <script type="text/babel">
		  $('.search input').on('input', function(event) { 
                 let textSearch = $(event.target).val();
                 textSearch = textSearch.trim() ; 
				 let listContactSearch = listContact.filter(function(contact) { 
							let username = contact.user.username; 
							if (username.includes(textSearch)) { 
									return true; 
							}
				 }); 
         		 ReactDOM.render( <ListContact contacts={listContactSearch} withId={withId} onlineUsers={onlineUsers} />, document.getElementById("contacts")); 
         });
         
         ReactDOM.render(
        <Messages messages={listMessages} currentUserProfile={currentUserProfile} withUserProfile={withUserProfile} currentId={currentId} withId={withId} />, document.getElementById("messages"));
    </script>
    
    <script type="text/babel">
    	var websocket = new WebSocket("ws://localhost:8080/webchat/server");
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
					 time : nowMillis
				 }
			}
			let message = JSON.stringify(msgObj);
			return message;
		}
		
		 $('.submit').click(function() {	
			   let message = getMessage ();
			   if (message != undefined) {
	               sendMessage(message);
				   $(".message-input input").val('');
			   }
	     });
		 
		 $(window).on('keydown', function(e) {
	            if (e.which == 13) {	            	
	            	let message = getMessage ();
					if (message != undefined) {
	                     sendMessage(message);
						 $(".message-input input").val('');
			        }
	                return false;
	            }
	      });	
    </script>
</body>
</html>