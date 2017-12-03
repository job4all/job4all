class AdvertiseMailer < ApplicationMailer
def adveritse_mail_sending new_ads, user
    @user = user
    @advertise = new_ads
    # emails = User.all.collect(&:email).join(", ")
    mail(to: user.email, subject: 'New Job Advertise', from: "Job4Pak")
  end
end