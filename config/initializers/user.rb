Rails.application.configure do
  config.after_initialize do
    # Extend the parent Model class
    BuriAuth.configuration.resource_class.constantize.class_eval do
      has_many :identities, dependent: :destroy

      devise :database_authenticatable,
             :registerable,
             :recoverable,
             :rememberable,
             :confirmable,
             :omniauthable,
             omniauth_providers: %i[facebook]

      def self.with_oauth(oauth)
        find_by(email: oauth[:info]['email'])
      end
    end
  end
end
