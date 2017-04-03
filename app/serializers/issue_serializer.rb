class IssueSerializer < ActiveModel::Serializer
  attributes :id, :issue, :hour, :description
end
