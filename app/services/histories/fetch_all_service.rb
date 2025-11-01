module Histories
  class FetchAllService
    def self.call
      History.order(created_at: :desc)
    end
  end
end