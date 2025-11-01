module Portfolios
  class FetchAllService
    def self.call
      Portfolio.order(created_at: :desc)
    end
  end
end