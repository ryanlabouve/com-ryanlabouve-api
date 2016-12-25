class Api::V1::ArticleResource < JSONAPI::Resource
  immutable
  attribute :title
  attribute :slug
  attribute :description
  attribute :content
  attribute :date

  filter :slug

  def self.default_sort
    [{field: 'date', direction: :desc}]
  end
end
