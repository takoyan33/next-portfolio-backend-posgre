module FrontSkills
  class FetchAllService
    def self.call
      FrontSkill.order(created_at: :asc)
    end
  end
end