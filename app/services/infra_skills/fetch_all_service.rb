module InfraSkills
  class FetchAllService
    def self.call
      InfraSkill.order(created_at: :desc)
    end
  end
end