module Api
  module V1
    class JobsController < BaseController
      before_action :set_history, only: [:show, :update, :destroy]

      def index
        @jobs = cached_response("jobs") do
          Job.all.to_a
        end
        render json: { status: 'SUCCESS', data:  @jobs }
      end

      def show
        @job = cached_response("job/#{params[:id]}") do
          Job.find(params[:id])
        end
        render json: { status: 'SUCCESS', data:  @job }
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
