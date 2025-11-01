module Licenses
  class FetchAllService
    def self.call
      License.order(created_at: :desc)
    end
  end
end