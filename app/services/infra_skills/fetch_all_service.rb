module InfraSkills
  class FetchAllService
    def self.call
      InfraSkill.order(created_at: :asc)
    end
  end
end