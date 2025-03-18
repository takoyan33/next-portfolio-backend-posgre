module Api
  module V1
    class HistoriesController < BaseController
      before_action :set_history, only: [:show, :update, :destroy]

      def index
        @histories = cached_response("histories") do
          History.all.to_a
        end
        render json: @histories
      end

      def show
        @history = cached_response("history/#{params[:id]}") do
          History.find(params[:id])
        end
        render json: @history
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
