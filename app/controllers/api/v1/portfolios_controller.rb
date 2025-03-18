module Api
  module V1
    class PortfoliosController < BaseController
      before_action :set_portfolio, only: [:show, :update, :destroy]

      def index
        @portfolios = cached_response("portfolios") do
          Portfolio.all.to_a
        end
        render json: @portfolios
      end

      def show
        @portfolio = cached_response("portfolio/#{params[:id]}") do
          Portfolio.find(params[:id])
        end
        render json: @portfolio
      end

      def create
        portfolio = Portfolio.new(portfolio_params)
        if portfolio.save
          render json: { status: 'SUCCESS', data: portfolio }
        else
          render json: { status: 'ERROR', data: portfolio.errors }
        end
      end

      def destroy
        @portfolio.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the portfolio', data: @portfolio }
      end

      def update
        if @portfolio.update(portfolio_params)
          render json: { status: 'SUCCESS', message: 'Updated the portfolio', data: @portfolio }
        else
          render json: { status: 'SUCCESS', message: 'Not updated', data: @portfolio.errors }
        end
      end

      private

      def set_portfolio
        @portfolio = Portfolio.find(params[:id])
      end

      def portfolio_params
        params.require(:portfolio).permit(:name, :date, {tag: []}, :topImg, :front_url, :front_github, :back_github, :color, :about, :aboutImg, :function, :functionImg, :appeal, :appealImg,  { front_skill: [] },  { back_skill: [] }, {infra_skill: []}, :time, :prev_title, :prev_article_id, :next_title, :next_article_id)
      end
    end
  end
end
