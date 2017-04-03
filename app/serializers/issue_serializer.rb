class IssueSerializer < ActiveModel::Serializer
  attributes :id, :issue, :hour, :description, :user_id
end
