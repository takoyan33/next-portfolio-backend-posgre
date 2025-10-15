module FrontSkills
  class FetchAllService
    def self.call
      FrontSkill.order(created_at: :desc)
    end
  end
end