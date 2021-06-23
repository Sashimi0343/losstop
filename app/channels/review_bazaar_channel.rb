class ReviewBazaarChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'review_bazaar_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
