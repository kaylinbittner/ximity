class RequestsController < ApplicationController
    # Every route needs a corresponding method in the controller and then a matching named view template
    # `before_action` calls the method set_request for the methods included in the `[]`
    # It helps eliminate lines of repeated code
    before_action :set_request, only: [:show, :edit, :update, :destroy]

    # This allows users to view offers without having to be signed in
    skip_before_action :authenticate_user!, only: [:index, :show]


    def index
        @requests = Request.all
    end

    def show
    end

    def new 
        @request = Request.new
    end

    def create
        @request = Request.new(request_params)
        @request.user = current_user
        if @request.save
          redirect_to request_path(@request)
        else
          render :new
        end
    end

    def edit
        puts "Hello, from the Requests Edit Method"
    end

    def update
        @request.update(request_params)
    
        # no need for app/views/restaurants/update.html.erb
        redirect_to request_path(@request)
      end
    
    def destroy
        if @request.destroy
            redirect_to requests_path
        else
            render 'requests/show'
        end
    end
    
    private

    def request_params
    params.require(:request).permit(:title, :description, :picture)
    end

    def set_request
        @request = Request.find(params[:id])
      end

end
