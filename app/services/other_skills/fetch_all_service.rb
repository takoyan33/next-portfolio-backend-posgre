module OtherSkills
  class FetchAllService
    def self.call
      OtherSkill.order(created_at: :asc)
    end
  end
end