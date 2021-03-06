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
    description: 'With a few simple changes to how we handle our web graphics we can prepare for the retina…',
    date: 'November 1, 2014'
  },
  {
    title: 'Sophisticating Your CSS',
    slug: 'sophisticating-your-css',
    content: 'articles/sophisticating-your-css.html',
    description: 'CSS is our way to style the web CSS is easy to write, but hard to write well…',
    date: 'November 16, 2014'
  },
  {
    title: 'Gulp for CSS: Up and Running',
    slug: 'gulp-for-css-pt1',
    content: 'articles/gulp-for-css-pt1.html',
    description: 'Setting up Gulp Separate authoring stylesheets from production stylesheets Automating Some Basic SASS things I recently evangelized using…',
    date: 'November 24, 2014'
  },
  {
    title: 'Gulp for CSS: Getting Sophisticated',
    slug: 'gulp-for-css-pt2',
    description: 'Different development and production stylesheets Development: easy to debug Production: minified Start automating repetitive tasks I recently evangelized…',
    content: 'articles/gulp-for-css-pt2.html',
    date: 'November 27, 2014'
  },
  {
    title: 'TodoMVC with Ember-CLI',
    slug: 'todomvc-ember-cli',
    description: 'Get started with Ember-CLI by building TodoMVC. This is a long screencast, but we’ll build the whole thing:…',
    content: 'articles/todomvc-ember-cli.html',
    date: 'December 1, 2014'
  },
  {
    title: 'Embracing Minimal Design Sprints',
    slug: 'embracing-minimal-design-sprints',
    description: '“Weeks of programming can save you hours of planning” —Unknown We are all drunk with power. We can…',
    content: 'articles/embracing-minimal-design-sprints.html',
    date: 'December 20, 2014'
  },
  {
    title: 'Ember Problems, Connecting to Rails-API',
    slug: 'ember-problems-connecting-rails-api',
    description: 'Working with the front end is fun, but sometimes you just gotta have more firepower. Let\'s hookup to a rails api.',
    content: 'articles/ember-problems-connecting-rails-api.html',
    date: 'January 29, 2015'
  },
  {
    title: 'Maturing Development In 10 Abysmally Hard but Amazing Steps',
    slug: 'maturing-development-in-10-abysmally-hard-but-amazing-steps',
    description: 'Working at a startup tought me some things about development that have changed everything for me.',
    content: 'articles/maturing-development-in-10-abysmally-hard-but-amazing-steps.html',
    date: 'April 18, 2015'
  },
  {
    title: 'Blogging with Metalsmith',
    slug: 'blogging-with-metalsmith',
    description: 'Blogging with wordpress sucked. So, I switched to metalpress.',
    content: 'articles/blogging-with-metalsmith.html',
    date: 'September 19, 2015'
  },
  {
    title: 'Ember Problems, Pagination with an API',
    slug: 'ember-problems-pagination-with-api',
    description: 'When you have truckloads of data, you can\'t just have once massive payload. Let\'s talk about how to paginate.',
    content: 'articles/ember-problems-pagination-with-api.html',
    date: 'September 26, 2015'
  },
  {
    title: 'Ember Problems Infiniscroll with an API',
    slug: 'ember-problems-infiniscroll-with-api',
    description: 'When you don\'t want to click next use infiniscroll to load in data smootly',
    content: 'articles/ember-problems-infiniscroll-with-api.html',
    date: 'September 27, 2015'
  },
  {
    title: 'JWT Rails API Challenge',
    slug: 'jwt-rails-api-challenge',
    description: 'Quick and simple Rails API that is JSON API compliant and has secure resources (via JWT) and non-secure resources.',
    content: 'articles/jwt-rails-api-challenge.html',
    date: 'April 12, 2016'
  },
  {
    title: 'Ember Blog with JWT and Ember Simple Auth, Part 1',
    slug: 'ember-blog-with-jwt-and-esa',
    description: 'Setup Mirage and connect to Rails API for our toy blog',
    content: 'articles/ember-blog-with-jwt-and-esa.html',
    date: 'April 17, 2016'
  },
  {
    title: 'Ember Blog with JWT and Ember Simple Auth, Part 2',
    slug: 'ember-blog-with-jwt-and-esa-2',
    description: 'Setup Ember Simple Auth and connect to Rails API for our toy blog',
    content: 'articles/ember-blog-with-jwt-and-esa-2.html',
    date: 'April 18, 2016'
  },
  {
    title: 'Ember Closure Action Explorations Pt 1',
    slug: 'ember-closure-action-explorations-pt-1',
    description: 'Explore the fundamentals of Ember closure actions',
    content: 'articles/Ember-Closure-Action-Explorations-Part-1.html',
    date: 'Dec 29, 2016'
  },
  {
    title: 'Exploring Ember Closure Actions Part 2: New Patterns',
    slug: 'ember-closure-action-explorations-pt-2',
    description: 'New patterns with closure actions and friends',
    content: 'articles/Ember-Closure-Action-Explorations-Part-2.html',
    date: 'Jan 6, 2017'
  },
  {
    title: 'Ember Addons I Use Every Time',
    slug: 'embers-addons-i-use-every-time',
    description: 'A tour through the addons I use in every Ember projects. Specifically addons that change how I structure and write Ember applications.',
    content: 'articles/embers-bark.html',
    date: 'Jan 8, 2017'
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
      description: article[:description],
      date: Date.parse(article[:date]),
      content: 'Still reading'
    )
  end

  content = DocReader.new(article[:content]).to_string
  # binding.pry
  thisArticle.content = content

  thisArticle.save!
end
