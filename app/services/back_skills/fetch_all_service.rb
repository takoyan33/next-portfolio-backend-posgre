module BackSkills
  class FetchAllService
    def self.call
      BackSkill.order(created_at: :asc)
    end
  end
end