class NewsletterController < ApplicationController
  def new
  end

    def create
    NewsletterJob.perform_later({
      emails: params[:emails],
      subject: params[:subject],
      newsletter: params[:newsletter]
      })
      flash[:success] = 'T-Shirt Town Newsletter sent!'
      redirect_to new_newsletter_path
    end

end
