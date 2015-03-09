require('bundler/setup')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  @internships = Internship.all()
  erb :internships
end

get '/new_internship' do
  erb :new_internship
end

get '/internships' do
  @internships = Internship.all()
  erb :internships
end

post '/internships' do
  internship = Internship.create({
    :company_name => params.fetch("company_name"),
    :contact_name => params.fetch("contact_name"),
    :contact_phone => params.fetch("contact_phone"),
    :contact_email => params.fetch("contact_email"),
    :company_website => params.fetch("company_website"),
    :company_address => params.fetch("company_address"),
    :company_description => params.fetch("company_description"),
    :intern_work => params.fetch("intern_work"),
    :intern_ideal => params.fetch("intern_ideal"),
    :intern_count => params.fetch("intern_count"),
    :intern_clearance => params.fetch("intern_clearance"),
    :intern_clearance_description => params.fetch("intern_clearance_description"),
    :mentor_name => params.fetch("mentor_name"),
    :mentor_email => params.fetch("mentor_email"),
    :mentor_phone => params.fetch("mentor_phone")
  })
  internship_id = internship.id()
  redirect "/internships/#{internship_id}"
end

get '/internships/:internship_id' do
  @internship = Internship.find(params.fetch('internship_id'))
  erb :internship
end
