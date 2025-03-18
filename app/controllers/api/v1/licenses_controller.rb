module Api
  module V1
    class LicensesController < BaseController
      before_action :set_license, only: [:show, :update, :destroy]

      def index
        @licenses = cached_response("licenses") do
          License.all.to_a
        end
        render json: @licenses
      end

      def show
        @license = cached_response("license/#{params[:id]}") do
          License.find(params[:id])
        end
        render json: @license
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
