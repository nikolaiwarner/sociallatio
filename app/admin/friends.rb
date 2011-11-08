ActiveAdmin.register Friend do


  controller do
    def resource
      end_of_association_chain.find_by_slug params[:id], current_user
    end
  end


end
