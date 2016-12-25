class Api::V1::ArticleResource < JSONAPI::Resource
  immutable
  attribute :title
  attribute :slug
  attribute :description
  attribute :content
  attribute :date

  filter :slug
end
