require 'buri_auth/omniauth/facebook'
require 'buri_auth/omniauth/google_oauth2'

module BuriAuth
  class OmniauthAuthenticationService
    attr_reader :oauth, :identity

    def initialize(oauth)
      @oauth = oauth
      @identity = Identity.includes(:user).find_by(uid: oauth[:uid], provider: oauth[:provider])
    end

    def call
      return signin_strategy if identity.present?

      signup_strategy
    rescue ActiveRecord::RecordInvalid => error
      respond_with(message: error.message, status: :error)
    end

    private

    def signin_strategy
      identity.update(oauth_token: oauth[:credentials][:token])

      respond_with(identity: identity.reload, status: :ok)
    end

    def signup_strategy
      user = User.find_by(email: oauth.dig(:info, :email))

      return new_provider_strategy(user) if user.present?

      new_user_strategy
    end

    def new_provider_strategy(user)
      identity = Identity.create_for(oauth: oauth, user: user)

      respond_with(
        status: :ok,
        message: I18n.t('activerecord.notices.models.identity.create_for_existing_user'),
        identity: identity
      )
    end

    def new_user_strategy
      profile_details = provider_klass.new(oauth).to_h
      user = User.new(profile_details)
      @identity = Identity.create_for(oauth: oauth, user: user)

      respond_with(status: :ok,
                   message: I18n.t('activerecord.notices.models.user.create'),
                   identity: identity)
    end

    def provider_klass
      "BuriAuth::Omniauth::#{oauth[:provider].camelcase}".constantize
    end

    def respond_with(status: nil, message: nil, identity: nil)
      {
        identity: identity,
        user: identity&.user,
        message: message,
        status: status
      }
    end
  end
end
