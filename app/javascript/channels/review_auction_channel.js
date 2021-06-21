import consumer from "./consumer"

consumer.subscriptions.create("ReviewAuctionChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `
      <div>
        <p>${data.content.name}</p>
        <p><strong>${data.content.comment}</strong></p><br>
      </div>`;
    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('review_auction_comment');
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
  }
});
