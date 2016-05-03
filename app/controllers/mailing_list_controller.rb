class MailingListController < ApplicationController
  def subscribe
    # Cocoa Academy Prelaunch List ID: 425e2e97e8
    list_id = ENV["MAILCHIMP_LIST_ID"]

    if params[:email].present?
      begin
        MailingList.new(list_id).subscribe(params[:email])
        flash[:notice] = "Successfully subscribed to the list!"
        redirect_to :back
      rescue Gibbon::MailChimpError => _
        flash[:alert] = "Unable to subscribe to the list. Email was invalid or user was already a member."
        redirect_to :back
      end
    else
      flash[:alert] = "Unable to subscribe to the list. Email was invalid or user was already a member."
      redirect_to :back
    end
  end
end
