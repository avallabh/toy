class UserFeedback < MailForm::Base
  attribute :first_name, validate: true
  attribute :last_name, validate: true
  attribute :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :subject, validate: true
  attribute :body, validate: true

  def headers
    {
      subject: "[Gotta Go] - #{subject}",
      to: "ajay.vallabh@gmail.com",
      from: "#{first_name} #{last_name} - #{email}"
    }
  end
end
