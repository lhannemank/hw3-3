class EntriesController < ApplicationController

    def index
      # find all Entry rows
      @entries = Entry.all
      # render companies/index view
    end
    
    def show
      @place = Place.find_by({"id" => params["id"]})
      @entry = Entry.find_by({"place_id" => @place["id"]})

    end
  
    def new
      # render view with new Company form
      @entry = Entry.new
    end
  
    def create
      # start with a new Company
      @entry = Entry.new
  
      # assign user-entered form data to Company's columns
      @entry["title"] = params["title"]
      @entry["description"] = params["description"]
      @entry["state"] = params["state"]
  
      # save Company row
      @entry.save
  
      # redirect user
      redirect_to "/entries"
    end
  
    def edit
      # find a Company
      @company = Company.find_by({ "id" => params["id"] })
      # render view with edit Company form
    end
  
    def update
      # find a Company
      @company = Company.find_by({ "id" => params["id"] })
  
      # assign user-entered form data to Company's columns
      @company["name"] = params["name"]
      @company["city"] = params["city"]
      @company["state"] = params["state"]
  
      # save Company row
      @company.save
  
      # redirect user
      redirect_to "/companies"
    end
  
    def destroy
      # find a Company
      @company = Company.find_by({ "id" => params["id"] })
  
      # destroy Company row
      @company.destroy
  
      # redirect user
      redirect_to "/companies"
    end
  
    
end
