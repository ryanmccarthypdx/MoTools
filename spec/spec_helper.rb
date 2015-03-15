ENV['RACK_ENV'] = 'test'
require('csv')
require('./app')
# require('open-uri')

require('bundler/setup')
Bundler.require(:default, :test)

RSpec.configure do |config|
  config.after(:each) do
    Internship.all().each() do |internship|
      internship.destroy()
    end

    Student.all().each() do |student|
      student.destroy()
    end

    Rating.all().each() do |rating|
      rating.destroy()
    end
  end
end
