class LeadsController < ApplicationController
  def create
    @lead = Lead.new lead_params
    if @lead.save
      # cookies[:saved_lead] = false
      redirect_to root_path, notice: "Saved successfully!"
    else
      redirect_to root_path, alert: "Failed to save"
    end
  end

  private

    def lead_params
      params.require(:lead).permit(:name, :email)
    end
end
