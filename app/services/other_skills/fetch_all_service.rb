module OtherSkills
  class FetchAllService
    def self.call
      OtherSkill.order(created_at: :desc)
    end
  end
end