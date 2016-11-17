class NewsletterMailer < ApplicationMailer

  def weekly(args)
    mail subject: args[:subject], to: args[:emails]
  end

  def monthly
    mail subject: args[:subject], to: args[:emails]
  end
end
