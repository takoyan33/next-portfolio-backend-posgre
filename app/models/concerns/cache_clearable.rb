module CacheClearable
  extend ActiveSupport::Concern

  included do
    after_commit :clear_cache
  end

  private

  def clear_cache
    model_name = self.class.name.underscore.pluralize
    Rails.cache.delete(model_name)
    Rails.cache.delete("#{model_name.singularize}/#{id}")
  end
end 