class MailingListController < ApplicationController
  def subscribe
    # Cocoa Academy Prelaunch List ID: 425e2e97e8
    list_id = ENV["MAILCHIMP_LIST_ID"]

    if params[:email].present?
      begin
        MailingList.new(list_id).subscribe(params[:email])
        msg = { :list_id => list_id, :status => true, :message => "Successfully subscribed to the list!" }
      rescue Gibbon::GibbonError => _
        msg = { :status => false, :message => "Sorry we were unable to sign you up to the list as their appears to be an error on our end. Please try again later." }
      rescue Gibbon::MailChimpError => _
        msg = { :status => false, :message => "Unable to subscribe to the list. Email was invalid or user was already a member." }
      end
    else
      msg = { :status => false, :message => "Unable to subscribe to the list. Email was invalid or user was already a member." }
    end

    render :json => msg
  end
end
