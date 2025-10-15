module BackSkills
  class FetchAllService
    def self.call
      BackSkill.order(created_at: :desc)
    end
  end
end