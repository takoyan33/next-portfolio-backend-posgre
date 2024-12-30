module Api
  module V1
    class HistoriesController < ApplicationController
      before_action :set_history, only: [:show, :update, :destroy]

      def index
        histories = History.order(created_at: :desc)
        render json: { status: 'SUCCESS', data: histories }
      end

      def show
        render json: { status: 'SUCCESS', message: 'Loaded the history', data: @history }
      end

      def create
        history = History.new(history_params)
        if history.save
          render json: { status: 'SUCCESS', data: history }
        else
          render json: { status: 'ERROR', data: history.errors }
        end
      end

      def destroy
        @history.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the history', data: @history }
      end

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
        params.require(:history).permit(:title)
      end
    end
  end
end
