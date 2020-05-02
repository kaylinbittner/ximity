class OffersController < ApplicationController
    # Every route needs a corresponding method in the controller and then a matching named view template
    def index
        @offers = Offer.all
    end

    def show
        @offer = Offer.find(params[:id])
    end

    def create
        @offer = Offer.new(offer_params)
        if @offer.save
          redirect_to offer_path(@offer)
        else
          render :new
        end
      end
    
      def destroy
        @offer = Offer.find(params[:id])
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

end
