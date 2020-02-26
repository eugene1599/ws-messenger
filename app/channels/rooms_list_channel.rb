class RoomsListChannel < ApplicationCable::Channel
  def subscribed
    return stream_for 'all_private_rooms' if params[:private]

    stream_for 'all_public_rooms'
  end
end
