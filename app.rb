require('bundler/setup')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  redirect '/internships'
end

get '/internships' do
  @rated_internships = Internship.rated
  @unrated_internships = Internship.unrated
  erb :internships
end

get '/internships/new' do
  erb :new_internship
end

post '/internships' do
  internship = Internship.create({
    company_name: params[:company_name],
    contact_name: params[:contact_name],
    contact_phone: params[:contact_phone],
    contact_email: params[:contact_email],
    company_website: params[:company_website],
    company_address: params[:company_address],
    company_description: params[:company_description],
    intern_work: params[:intern_work],
    intern_ideal: params[:intern_ideal],
    intern_count: params[:intern_count],
    intern_clearance: params[:intern_clearance],
    intern_clearance_description: params[:intern_clearance_description],
    mentor_name: params[:mentor_name],
    mentor_email: params[:mentor_email],
    mentor_phone: params[:mentor_phone]
  })
  internship_id = internship.id()
  redirect "/internships"
end

get '/register' do
  erb :register
end

get '/login' do
  erb :login
end

get '/internships/:internship_id' do
  @responses = Rating.possible_ratings
  @internship = Internship.find(params.fetch('internship_id'))
  @editing = false

  if @internship.rating
    @route = "/internships/#{@internship.id}/edit_rating"
    @active_company_rating_value = @internship.rating.company_rating

    @editing = true
    erb :edit_rating
  else
    @route = "/internships/#{@internship.id}/new_rating"
    erb :new_rating
  end
end

post '/internships/:internship_id/new_rating' do
  @internship = Internship.find(params.fetch('internship_id'))
  Rating.create({

    # student_id will be implicit from login somwhow
    :student_id => params.fetch('student_id'),

    :internship_id => params.fetch('internship_id'),
    :company_rating => params.fetch("company_rating"),
    :project_rating => params.fetch("project_rating"),
    :personality_rating => params.fetch("personality_rating")
    })
  redirect "/internships"
end

post '/internships/:internship_id/edit_rating' do
  @internship = Internship.find(params.fetch('internship_id'))

  @internship.rating.update({
    :company_rating => params.fetch("company_rating"),
    :project_rating => params.fetch("project_rating"),
    :personality_rating => params.fetch("personality_rating")
    })
  redirect "/internships"
end
