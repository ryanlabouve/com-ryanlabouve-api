class Api::V1::ArticleResource < JSONAPI::Resource
  immutable
  attribute :title
  attribute :slug
  attribute :description
  attribute :content
  attribute :date

  filter :slug

  filter :limit, apply: ->(records, value, _options) {
    records.limit(value[0])
  }

  filter :term, apply: ->(records, value, _options) {
    records.where("content LIKE ?", "%#{value[0]}%")
  }

  def self.default_sort
    [{field: 'date', direction: :desc}]
  end
end
