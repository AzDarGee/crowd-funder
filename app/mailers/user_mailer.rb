class UserMailer < ActionMailer::Base
  default from: "crowdfundr@gmail.com"

  def project_email(user, project)
    @user = user
    @project = project
    mail(to: @user.email, subject: "New Project Added", from: "projects@crowdfundr.com")
  end
end