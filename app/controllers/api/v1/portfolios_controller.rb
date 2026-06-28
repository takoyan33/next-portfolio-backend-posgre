module Api
  module V1
    # API-016 ～ API-019
    #
    # Portfolios API Controller
    #
    # API-016
    # GET /api/v1/portfolios
    # ポートフォリオ一覧を取得
    #
    # API-017
    # POST /api/v1/portfolios
    # ポートフォリオを新規作成
    #
    # API-018
    # GET /api/v1/portfolios/:id
    # ポートフォリオ詳細を取得
    #
    # API-019
    # PATCH /api/v1/portfolios/:id
    # ポートフォリオを更新
    #
    # ※ DELETE は設計書未記載
    class PortfoliosController < ApplicationController
      before_action :set_portfolio, only: [:show, :update, :destroy]

      # API-016
      # ポートフォリオ一覧を取得
      def index
        portfolios = Portfolios::FetchAllService.call
        render json: { status: 'SUCCESS', data: portfolios }
      end

      # API-018
      # ポートフォリオ詳細を取得
      def show
        render json: { status: 'SUCCESS', data: @portfolio }
      end

      # API-017
      # ポートフォリオを新規作成
      def create
        portfolio = Portfolio.new(portfolio_params)
        if portfolio.save
          render json: { status: 'SUCCESS', data: portfolio }
        else
          render json: { status: 'ERROR', data: portfolio.errors }
        end
      end

      # API番号なし（設計書未記載）
      # ポートフォリオを削除
      def destroy
        @portfolio.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the portfolio', data: @portfolio }
      end

      # API-019
      # ポートフォリオを更新
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
        params.require(:portfolio).permit(
          :name,
          :date,
          { tag: [] },
          :topImg,
          :front_url,
          :back_url,
          :front_github,
          :back_github,
          :color,
          :about,
          :aboutImg,
          :function,
          :functionImg,
          :appeal,
          :appealImg,
          { front_skill: [] },
          { back_skill: [] },
          { infra_skill: [] },
          :time,
          :prev_title,
          :prev_article_id,
          :next_title,
          :next_article_id
        )
      end
    end
  end
end