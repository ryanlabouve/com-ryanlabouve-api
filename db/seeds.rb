# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 10.times do
#   Article.create!(
#     title: Faker::Name.name,
#     slug: Faker::Internet.slug,
#     description: Faker::Lorem.paragraph,
#     content: '<strong>yay!</strong>',
#     date: Faker::Time.backward(60)
#   )
# end

Articles = [
  {
    title: 'Don\'t Overthink Retina',
    slug: 'dont-overthink-retina',
    content: 'articles/dont-overthink-retina.html',
    date: 'November 1, 2014'
  },
  {
    title: 'Sophisticating Your CSS',
    slug: 'sophisticating-your-css',
    content: 'articles/sophisticating-your-css.html',
    date: 'November 16, 2014'
  },
  {
    title: 'Gulp for CSS: Up and Running',
    slug: 'gulp-for-css-pt1',
    content: 'articles/gulp-for-css-pt1.html',
    date: 'November 24, 2014'
  },
  {
    title: 'Gulp for CSS: Getting Sophisticated',
    slug: 'gulp-for-css-pt2',
    content: 'articles/gulp-for-css-pt2.html',
    date: 'November 27, 2014'
  },
  {
    title: 'TodoMVC with Ember-CLI',
    slug: 'todomvc-ember-cli',
    content: 'articles/todomvc-ember-cli.html',
    date: 'December 1, 2014'
  },
  {
    title: 'Embracing Minimal Design Sprints',
    slug: 'embracing-minimal-design-sprints',
    content: 'articles/embracing-minimal-design-sprints.html',
    date: 'December 20, 2014'
  },
  {
    title: 'Ember Problems, Connecting to Rails-API',
    slug: 'ember-problems-connecting-rails-api',
    content: 'articles/ember-problems-connecting-rails-api.html',
    date: 'January 29, 2015'
  },
  {
    title: 'Maturing Development In 10 Abysmally Hard but Amazing Steps',
    slug: 'maturing-development-in-10-abysmally-hard-but-amazing-steps',
    content: 'articles/maturing-development-in-10-abysmally-hard-but-amazing-steps.html',
    date: 'April 18, 2015'
  },
  {
    title: 'Blogging with Metalsmith',
    slug: 'blogging-with-metalsmith',
    content: 'articles/blogging-with-metalsmith.html',
    date: 'September 19, 2015'
  },
  {
    title: 'Ember Problems, Pagination with an API',
    slug: 'ember-problems-pagination-with-api',
    content: 'articles/ember-problems-pagination-with-api.html',
    date: 'September 26, 2015'
  },
  {
    title: 'Ember Problems Infiniscroll with an API',
    slug: 'ember-problems-infiniscroll-with-api',
    content: 'articles/ember-problems-infiniscroll-with-api.html',
    date: 'September 27, 2015'
  },
  {
    title: 'JWT Rails API Challenge',
    slug: 'jwt-rails-api-challenge',
    content: 'articles/jwt-rails-api-challenge.html',
    date: 'April 12, 2016'
  },
  {
    title: 'Ember Blog with JWT and Ember Simple Auth, Part 1',
    slug: 'ember-blog-with-jwt-and-esa',
    content: 'articles/ember-blog-with-jwt-and-esa.html',
    date: 'April 17, 2016'
  },
  {
    title: 'Ember Blog with JWT and Ember Simple Auth, Part 2',
    slug: 'ember-blog-with-jwt-and-esa-2',
    content: 'articles/ember-blog-with-jwt-and-esa-2.html',
    date: 'April 18, 2016'
  }
]

class DocReader
  def initialize(filepath)
    @filepath = filepath
  end

  def to_string
    file = File.open(@filepath, 'r')
    file.read
  end
end

Article.all.destroy_all

Articles.each do |article|
  # try to find by slug
  queryArticles = Article.where(slug: article[:slug])
  puts "ERROR: Multiple with same slug" if queryArticles.count > 1

  thisArticle = queryArticles.first

  if thisArticle.nil?
    thisArticle = Article.new(
      title: article[:title],
      slug: article[:slug],
      date: Date.parse(article[:date]),
      content: 'Still reading'
    )
  end

  content = DocReader.new(article[:content]).to_string
  # binding.pry
  thisArticle.content = content

  thisArticle.save!
end
