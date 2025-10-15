module Api
  module V1
    # jobs API Controller
    #
    # @example
    #   GET /api/v1/jobs
    #   => { status: 'SUCCESS', data: [...] }
    #
    # @see jobs
    #
    class JobsController < ApplicationController
      before_action :set_history, only: [:show, :update, :destroy]
      # job一覧を取得
      def index
        jobs = Jobs::FetchAllService.call
        render json: { status: 'SUCCESS', data: jobs }
      end

      def show
        render json: { status: 'SUCCESS', data: @job }
      end

      def create
        job = Job.new(history_params)
        if job.save
          render json: { status: 'SUCCESS', data: job }
        else
          render json: { status: 'ERROR', data: job.errors }
        end
      end

      def destroy
        @job.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the job', data: @job }
      end

      def update
        if @job.update(history_params)
          render json: { status: 'SUCCESS', message: 'Updated the job', data: @job }
        else
          render json: { status: 'SUCCESS', message: 'Not updated', data: @job.errors }
        end
      end

      private

      def set_history
        @job = Job.find(params[:id])
      end

      def history_params
        params.require(:job).permit(:title)
      end
    end
  end
end
