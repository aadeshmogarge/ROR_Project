class Participant < ApplicationRecord
  belongs_to :study, touch: true

  after_save :send_email
  before_save :store_cache

  private

  def store_cache
    binding.pry
    Rails.cache.write(name.to_s, { name: name, email: email })
  end

  def send_email
    ParticipantMailer.with(participant: self).success_email.deliver_later
  end
end
