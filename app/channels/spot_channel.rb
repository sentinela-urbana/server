class SpotChannel < ApplicationCable::Channel
  attr_accessor :spots

  def subscribed
    stream_from channel_id
  end

  def unsubscribed
    stop_all_streams
  end

  def receive(data)
    case data['type']
    when 'OFFER'
      return unless spot_can_broadcast?

      ActionCable.server.broadcast(channel_id, data)
    when 'ANSWER', 'CANDIDATE'
      return unless user_can_access?

      ActionCable.server.broadcast(channel_id, data)
    when 'ASSISTANCE'
      ActionCable.server.broadcast(channel_id, data)
    end
  end

  private

  def spot_id
    @spot_id ||= params[:spot_id]
  end

  def channel_id
    "spot_#{spot_id}"
  end

  def spot_can_broadcast?
    current_user.spot?
  end

  def user_can_access?
    current_user.surveillance? && current_user.monitored_spots.exists?(spot_id)
  end
end
