module Api
  class ProjectResource < JSONAPI::Resource
    immutable

    attributes :owner,
               :name,
               :name_with_owner,
               :github_id,
               :score

    def id
      github_id
    end

    def self.find_by_key(key, options = {})
      context = options[:context]
      records = records(options)
      records = apply_includes(records, options)
      model = records.find_by(github_id: key)
      fail JSONAPI::Exceptions::RecordNotFound, key if model.nil?
      resource_for_model(model).new(model, context)
    end
  end
end
