class ContactAuctionChannel < ApplicationCable::Channel
  def subscribed
    stream_from "contact_auction_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
