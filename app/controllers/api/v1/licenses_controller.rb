module Api
  module V1
    # API-008 ～ API-011
    #
    # Licenses API Controller
    #
    # API-008
    # GET /api/v1/licenses
    # 資格一覧を取得
    #
    # API-009
    # POST /api/v1/licenses
    # 資格を新規作成
    #
    # API-010
    # GET /api/v1/licenses/:id
    # 資格詳細を取得
    #
    # API-011
    # PATCH /api/v1/licenses/:id
    # 資格を更新
    #
    # ※ DELETE は設計書未記載
    class LicensesController < ApplicationController
      before_action :set_license, only: [:show, :update, :destroy]

      # API-008
      # 資格一覧を取得
      def index
        licenses = Licenses::FetchAllService.call
        render json: { status: 'SUCCESS', data: licenses }
      end

      # API-010
      # 資格詳細を取得
      def show
        render json: { status: 'SUCCESS', data: @license }
      end

      # API-009
      # 資格を新規作成
      def create
        license = License.new(license_params)
        if license.save
          render json: { status: 'SUCCESS', data: license }
        else
          render json: { status: 'ERROR', data: license.errors }
        end
      end

      # API番号なし（設計書未記載）
      # 資格を削除
      def destroy
        @license.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the license', data: @license }
      end

      # API-011
      # 資格を更新
      def update
        if @license.update(license_params)
          render json: { status: 'SUCCESS', message: 'Updated the license', data: @license }
        else
          render json: { status: 'SUCCESS', message: 'Not updated', data: @license.errors }
        end
      end

      private

      def set_license
        @license = License.find(params[:id])
      end

      def license_params
        params.require(:license).permit(:title, :date)
      end
    end
  end
end