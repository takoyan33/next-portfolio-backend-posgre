module Api
  module V1
    # API-012 ～ API-015
    #
    # Jobs API Controller
    #
    # API-012
    # GET /api/v1/jobs
    # 職歴一覧を取得
    #
    # API-013
    # POST /api/v1/jobs
    # 職歴を新規作成
    #
    # API-014
    # GET /api/v1/jobs/:id
    # 職歴詳細を取得
    #
    # API-015
    # PATCH /api/v1/jobs/:id
    # 職歴を更新
    #
    # ※ DELETE は設計書未記載
    class JobsController < ApplicationController
      before_action :set_job, only: [:show, :update, :destroy]

      # API-012
      # 職歴一覧を取得
      def index
        jobs = Jobs::FetchAllService.call
        render json: { status: 'SUCCESS', data: jobs }
      end

      # API-014
      # 職歴詳細を取得
      def show
        render json: { status: 'SUCCESS', data: @job }
      end

      # API-013
      # 職歴を新規作成
      def create
        job = Job.new(job_params)
        if job.save
          render json: { status: 'SUCCESS', data: job }
        else
          render json: { status: 'ERROR', data: job.errors }
        end
      end

      # API番号なし（設計書未記載）
      # 職歴を削除
      def destroy
        @job.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the job', data: @job }
      end

      # API-015
      # 職歴を更新
      def update
        if @job.update(job_params)
          render json: { status: 'SUCCESS', message: 'Updated the job', data: @job }
        else
          render json: { status: 'SUCCESS', message: 'Not updated', data: @job.errors }
        end
      end

      private

      def set_job
        @job = Job.find(params[:id])
      end

      def job_params
        params.require(:job).permit(:title, :date, :body)
      end
    end
  end
end