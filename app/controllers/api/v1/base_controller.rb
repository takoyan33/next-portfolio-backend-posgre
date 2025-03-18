module Api
  module V1
    class BaseController < ApplicationController
      private

      def cached_response(cache_key, expires_in: 12.hours)
        Rails.cache.fetch(cache_key, expires_in: expires_in) do
          yield
        end
      end
    end
  end
end 