class PortfoliosController < ApplicationController
    def index
        @portfolios=Portfolio.all
    end
    def new
        @portfolio=Portfolio.new
    end
    def create
        @portfolio=Portfolio.new(params.require(:portfolio).permit(:title,:subtitle,:body))
        
        respond_to do |format|
            if @portfolio.save
                format.html {redirect_to portfolios_path , notice: "Your portfolio is saved."}
            else
                format.html {render :new}
            end
        end
    end
    def edit
        @portfolio=Portfolio.friendly.find(params[:id])
    end
    def update
        @portfolio=Portfolio.friendly.find(params[:id])

        respond_to do |format|
            if @portfolio.update(params.require(:portfolio).permit(:title,:subtitle,:body))
                format.html {redirect_to portfolios_path , notice: "Your portfolio is updated succesfully"}
            else
                format.html {render :edit}
            end
        end
    end
    def destroy
        @portfolio=Portfolio.friendly.find(params[:id])
        @portfolio.destroy
        
        respond_to do |format|
            format.html {redirect_to portfolios_path , notice: "Portfolio is deleted" }
            format.json {head :no_content}
        end
    end
end
