class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: false
  validates :firstname, presence: false
  validates :lastname, presence: false
  validates :birthday, presence: false
  # validates_date :birthday, :before => lambda { 16.years.ago },
  #                              :before_message => "Vous devez être âgé de plus de 16 ans"
  # validates_date :birthday, :on_or_after => lambda { 125.years.ago },
  #                              :before_message => "Êtes-vous certain d'être né au 19ème siècle ?"
  # validates :sexe, presence: false, inclusion: {in: ["Male","Female"]}
  validates :address, presence: false
  validates :zip_code, presence: false
  validates :city, presence: false
  # validates :phone_number, :phony_plausible => true, presence: false
  # validates :status, :inclusion => {:in => [true, false]}, presence: false
  validates :avg_rating_user, presence: false
  geocoded_by :full_street_address


   def full_street_address
    [address, zip_code, city].compact.join(', ')
  end
end
