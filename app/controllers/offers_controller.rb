class OffersController < ApplicationController
    # Every route needs a corresponding method in the controller and then a matching named view template
    # `before_action` calls the method set_offer for the methods included in the `[]`
    # It helps eliminate lines of repeated code
    before_action :set_offer, only: [:show, :edit, :update, :destroy]

    # This allows users to view offers without having to be signed in
    skip_before_action :authenticate_user!, only: [:index, :show]


    def index
        @offers = Offer.all
    end

    def show
    end

    def new 
        @offer = Offer.new
    end

    def create
        @offer = Offer.new(offer_params)
        @offer.user = current_user
        if @offer.save
          redirect_to offer_path(@offer)
        else
          render :new
        end
    end

    def edit
        puts "Hello, from the Offers Edit Method"
    end

    def update
        @offer.update(offer_params)
    
        # no need for app/views/restaurants/update.html.erb
        redirect_to offer_path(@offer)
      end
    
    def destroy
        if @offer.destroy
            redirect_to offers_path
        else
            render 'offers/show'
        end
    end
    
    private

    def offer_params
    params.require(:offer).permit(:title, :description, :picture)
    end

    def set_offer
        @offer = Offer.find(params[:id])
      end

end
