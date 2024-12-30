module Api
  module V1
    class LicensesController < ApplicationController
      before_action :set_license, only: [:show, :update, :destroy]

      def index
        licenses = License.order(created_at: :desc)
        render json: { status: 'SUCCESS', data: licenses }
      end

      def show
        render json: { status: 'SUCCESS', message: 'Loaded the license', data: @license }
      end

      def create
        license = License.new(license_params)
        if license.save
          render json: { status: 'SUCCESS', data: license }
        else
          render json: { status: 'ERROR', data: license.errors }
        end
      end

      def destroy
        @license.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the license', data: @license }
      end

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
        params.require(:license).permit(:title)
      end
    end
  end
end
