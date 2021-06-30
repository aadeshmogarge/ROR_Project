class ParticipantsMailer < ApplicationMailer
  def success_email
    @participant = params[:participant]
    details = Rails.cache.read(@participant.name.to_s)

    mail(to: details[:email], subject: 'Participant created successfully')
  end
end
