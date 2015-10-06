class SavedPreferencesController < ApplicationController
  

  # the index allows me to view a list of saved_preferences on one page
  # the show allows me to view the details of every saved_preference
  # the "find param..." helps locate the saved_preference in the database by its ID

  # the create is to save the new saved_preference
    def create
    #render plain: params[:saved_preference].inspect
    # to display the paramerters that are coming in the form
    #  @saved_preference = SavedPreference.new(params.require(:saved_preference).permit(:title, :text))
      @saved_preference = SavedPreference.new(saved_preferences_params)
      if saved_preferences_params[:location]
# this joins the saved preference for the location into a string which is the type of the attribute location
        saved_preferences_params[:location] = saved_preferences_params[:location].join(",")
      end
      @saved_preference.save
      redirect_to root_path  # root_path is the index of the post , to find out, type rake routes & look under prefix
    end


    def update
    @saved_preference =  SavedPreference.find(params[:id])
    if saved_preferences_params[:location]
      saved_preferences_params[:location] = saved_preferences_params[:location].join(",")
    end
    if @saved_preference.update(saved_preferences_params)
      redirect_to root_path
    else
      # add an error message that displays if save is unsuccessful
      redirect_to root_path
    end
    end


    def destroy

    @saved_preference = SavedPreference.find(params[:id])
    @saved_preference.destroy
    redirect_to saved_preferences_path

    end

    private

    def saved_preferences_params
#this code allows to save an array into the database, because for security reasons (we don't want a user to assign a saved preference to another use)
#this list is the whitelist
    params.require(:saved_preference).permit({ :location => [] }, :user_id)
    end
end
