module Profiles
  class FetchAllService
    def self.call
      Profile.order(created_at: :desc)
    end
  end
end