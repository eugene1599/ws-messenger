module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    def ability
      @ability ||= Ability.new(current_user)
    end

    private

    def find_verified_user
      env['rack.session'] = cookies.encrypted[Rails.application.config.session_options[:key]]
      verified_user = Warden::SessionSerializer.new(env).fetch(:user)
      return verified_user if verified_user

      reject_unauthorized_connection
    end
  end
end
