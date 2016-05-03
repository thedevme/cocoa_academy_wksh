class MailingListController < ApplicationController
  def subscribe
    # Cocoa Academy Prelaunch List ID: 425e2e97e8
    list_id = ENV["MAILCHIMP_LIST_ID"]

    if params[:email].present?
      begin
        MailingList.new(list_id).subscribe(params[:email])
        render json: { message: "Successfully subscribed to the list!" }
      rescue Gibbon::MailChimpError => _
        render json: { message: "Unable to subscribe to the list. Email was invalid or user was already a member." }, status: 500
      end
    else
      render json: { message: "Email is required" }, status: 500
    end
  end
end
