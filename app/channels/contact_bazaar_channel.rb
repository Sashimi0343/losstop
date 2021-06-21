class ContactBazaarChannel < ApplicationCable::Channel
  def subscribed
    stream_from "contact_bazaar_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
