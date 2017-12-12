class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes

  validates :message, presence: true, length: {maximum: 140, too_long: 'Bruh you only got 140 characters max.  Stop dat.'}


  def self.search_by_message(search_string)
    where("message ILIKE ?", "%#{search_string}%")
  end
end

# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  message    :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_tweets_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
