module Api
  module V1
    # API-004 ～ API-007
    #
    # Histories API Controller
    #
    # API-004
    # GET /api/v1/histories
    # 経歴一覧を取得
    #
    # API-005
    # POST /api/v1/histories
    # 経歴を新規作成
    #
    # API-006
    # GET /api/v1/histories/:id
    # 経歴詳細を取得
    #
    # API-007
    # PATCH /api/v1/histories/:id
    # 経歴を更新
    #
    # ※ DELETE は設計書未記載
    class HistoriesController < ApplicationController
      before_action :set_history, only: [:show, :update, :destroy]

      # API-004
      # 経歴一覧を取得
      def index
        histories = History.order(created_at: :desc)
        render json: { status: 'SUCCESS', data: histories }
      end

      # API-006
      # 経歴詳細を取得
      def show
        render json: { status: 'SUCCESS', message: 'Loaded the history', data: @history }
      end

      # API-005
      # 経歴を新規作成
      def create
        history = History.new(history_params)
        if history.save
          render json: { status: 'SUCCESS', data: history }
        else
          render json: { status: 'ERROR', data: history.errors }
        end
      end

      # API番号なし（設計書未記載）
      # 経歴を削除
      def destroy
        @history.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the history', data: @history }
      end

      # API-007
      # 経歴を更新
      def update
        if @history.update(history_params)
          render json: { status: 'SUCCESS', message: 'Updated the history', data: @history }
        else
          render json: { status: 'SUCCESS', message: 'Not updated', data: @history.errors }
        end
      end

      private

      def set_history
        @history = History.find(params[:id])
      end

      def history_params
        params.require(:history).permit(:title, :date, :body)
      end
    end
  end
end