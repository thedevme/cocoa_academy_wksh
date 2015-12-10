ActiveAdmin.register Product do
  permit_params :title, :subtitle, :description, :sku, :price, :product_image, :details, :slug, :product_thumb_image, :location, :city, :date, :location_image, :location_address, :email_image

  controller do
      def find_resource
        begin
          scoped_collection.where(slug: params[:id]).first!
        rescue ActiveRecord::RecordNotFound
          scoped_collection.find(params[:id])
        end
      end
    end


# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
