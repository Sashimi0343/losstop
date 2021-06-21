import consumer from "./consumer"

consumer.subscriptions.create("ContactBazaarChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `
      <% if contact.user_id == nil %>
        <div>
          <p><%= data.content.company.name %></p>
          <p><strong>${data.content.message}</strong></p><br>
        </div>
      <% else %>
        <div>
          <p><%= data.content.user.nickname %></p>
          <p><strong>${data.content.message}</strong></p><br>
        </div>
      <% end %>`;
    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('contact_bazaar_message');
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
  }
});
