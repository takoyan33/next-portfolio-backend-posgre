module Jobs
  class FetchAllService
    def self.call
      Job.order(created_at: :desc)
    end
  end
end