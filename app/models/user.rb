class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  
  has_many :trips
  has_many :events, through: :trips
  has_many :registered_mates, through: :events, source: :event_registrations
  has_many :mates, through: :registered_mates, source: :user
  
  has_many :event_registrations
  has_many :registered_events, through: :event_registrations, source: :event
  has_many :registered_trips, through: :registered_events, source: :trip
  has_many :registered_events_owners, through: :registered_trips, source: :user


  has_one_attached :avatar

  acts_as_favoritor

  def chats
    registered_events + event_registrations
  end

  def chat_mates
    mate_ids = (mates + registered_events_owners).uniq
    mate_ids.map do |mate_id|
      if registered_mates.joins( :user ).find_by('users.id = ?', mate_id) 
        registered_mates.joins( :user ).find_by('users.id = ?', mate_id) 
      else 
        event_registrations.joins(event: { trip: :user }).find_by('users.id = ?', mate_id)
      end
    end
  end

  def num_listings
    registered_mates.count
  end

  def notifications
    upcoming_events.count + num_registered_events + registered_mates.count 
  end

  def upcoming_events
    events.where("events.start_date >= ?", Date.today)
  end

  def past_events
    events.where("events.start_date < ?", Date.today)
  end

  def num_registered_events
    registered_events.count
  end

  def num_favs
    all_favorites.count
  end

  def registered?(event)
    event_registrations.find_by(event: event)
  end

  def full_name
    if first_name && last_name
      "#{first_name.capitalize} #{last_name.capitalize}"
    elsif username
      username
    else
      'Mate'
    end
  end

  def age
    today = Date.today
    age = today.year - date_of_birth.year
    age -= 1 if date_of_birth.strftime("%m%d").to_i > today.strftime("%m%d").to_i
    age
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.google_data"]
        user.email = data["info"]["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(access_token)
      data = access_token.info
      user = find_or_initialize_by(provider: access_token['provider'], uid: access_token['uid'])
      user.email = data['email']
      user.password = Devise.friendly_token[0, 20]
      # user.avatar = auth.info.image # assuming the user model has an image

      user.save
      user
  end
end
