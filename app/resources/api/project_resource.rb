module Api
  class ProjectResource < JSONAPI::Resource
    immutable

    attributes :owner,
               :name,
               :name_with_owner,
               :github_id,
               :score

    def self._primary_key
      :github_id
    end
  end
end
