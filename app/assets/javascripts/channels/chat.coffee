App.chat = App.cable.subscriptions.create "ChatChannel",

# 클라이언트단
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    unless data.body.blank?
      $('#messages').append '<p class="message-user-name-coffee">' + 
      data.message_user.nic_name + '(방금)' +'</p>' +
      '<p>' + data.body + '</p>'
      # ExecJS::RuntimeError는 "<div ~~>" 에서 큰따옴표로 묶어서 오류난 것이다.
      # '<div ~~>' 이렇게 해줘야 한다. 
      
      $("#new_message")[0].reset() 
      # 메세지 보내기 누른 후, 폼 필드창에 남아있는 메세지 리셋
   
   