# Preview all emails at http://localhost:3000/rails/mailers/device_mailer
class DeviceMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/device_mailer/welcome
  def welcome
    DeviceMailer.welcome
  end
end
