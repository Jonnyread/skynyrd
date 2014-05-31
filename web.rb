require 'sinatra'
require 'twilio-ruby'

get '/' do
  Twilio::TwiML::Response.new do |r|
    r.Say 'Welcome to the Lynyrd Skynyrd Life Lessons Hotline.  We are here to help you with whatever problems you may be facing.  Please listen to the following menu and select the issue you need help with.' , :voice => "woman"
    r.Gather :numDigits => '1', :action => '/lesson', :method => 'get' do |g|
      g.Say 'Press 1 if you are struggling to understand your lifes purpose.', :voice => "woman"
      g.Say 'Press 2 if you are having trouble prioritizing life, work, and love.', :voice => "woman"
      g.Say 'Press 3 if you are thinking you may be partying to much.', :voice => "woman"
      g.Say 'Press 4 if you are having problems dealing with loss.', :voice => "woman"
      g.Say 'Press 5 if you have to end a relationship you care about.', :voice => "woman"
      g.Say 'Press 6 if your family is having financial issues.', :voice => "woman"
      g.Say 'Press any other button to hear the menu again.', :voice => "woman"
    end
  end.text
end

get '/lesson' do
  redirect '/' unless ['1', '2', '3', '4', '5', '6'].include?(params['Digits'])
  if params['Digits'] == '1'
    redirect '/lesson/1'
  elsif params['Digits'] == '2'
    redirect '/lesson/2'
  elsif params['Digits'] == '3'
    redirect '/lesson/3'
  elsif params['Digits'] == '4'
    redirect '/lesson/4'
  elsif params['Digits'] == '5'
    redirect '/lesson/5'
  elsif params['Digits'] == '6'
    redirect '/lesson/6'
  end
  response.text
end

get '/lesson/1' do
  Twilio::TwiML::Response.new do |r|
    r.Say 'Many people struggle to understand their lifes purpose.  While we can not tell you specifics about your situation.  Let this be your guiding light.'
    r.Play 'https://s3-us-west-2.amazonaws.com/skynyrd/03+-+Simple+Man.mp3'
    r.Say 'Feeling better? Great because it does not get much better than that. What would you like to do next?'
    r.Gather :numDigits => '1', :action => '/lesson/1/done', :method => 'get' do |g|
      g.Say 'Press 1 to hear the lesson again'
      g.Say 'Press 2 to go back to the main menu'
    end
  end.text
end

get '/lesson/1/done' do
  if params['Digits'] == '1'
    redirect '/lesson/1'
  elsif params['Digits'] == '2'
    redirect '/'
  end.text
end

get '/lesson/2' do
  Twilio::TwiML::Response.new do |r|
    r.Say 'Prioritizing your life can be very difficult.  We certainly understand that.  Listen to this lesson and get some help.'
    r.Play 'https://s3-us-west-2.amazonaws.com/skynyrd/2-09+Searchin%27.mp3'
    r.Say 'Feeling better? We are too. What would you like to do next?'
    r.Gather :numDigits => '1', :action => '/lesson/1/done', :method => 'get' do |g|
      g.Say 'Press 1 to hear the lesson again'
      g.Say 'Press 2 to go back to the main menu'
    end
  end.text
end

get '/lesson/2/done' do
  if params['Digits'] == '1'
    redirect '/lesson/1'
  elsif params['Digits'] == '2'
    redirect '/'
  end.text
end

get '/lesson/3' do
  Twilio::TwiML::Response.new do |r|
    r.Say 'We have all woken up with a serious headache wondering why we did whatever we did last night.  We feel you.  This lesson is for you.'
    r.Play 'https://s3-us-west-2.amazonaws.com/skynyrd/1-14+That+Smell.mp3'
    r.Say 'Feeling better? Well maybe not that headache, but hopefully that helped put some things in perspective. What would you like to do next?'
    r.Gather :numDigits => '1', :action => '/lesson/1/done', :method => 'get' do |g|
      g.Say 'Press 1 to hear the lesson again'
      g.Say 'Press 2 to go back to the main menu'
    end
  end.text
end

get '/lesson/3/done' do
  if params['Digits'] == '1'
    redirect '/lesson/1'
  elsif params['Digits'] == '2'
    redirect '/'
  end.text
end

get '/lesson/4' do
  Twilio::TwiML::Response.new do |r|
    r.Say 'Loss is one of the toughest parts about being human. Let this lesson help to put your mind and heart at ease.'
    r.Play 'https://s3-us-west-2.amazonaws.com/skynyrd/1-15+Free+Bird.mp3'
    r.Say 'Wow that makes us feel better everytime.  We hope it helped you too. What would you like to do next?'
    r.Gather :numDigits => '1', :action => '/lesson/1/done', :method => 'get' do |g|
      g.Say 'Press 1 to hear the lesson again'
      g.Say 'Press 2 to go back to the main menu'
    end
  end.text
end

get '/lesson/4/done' do
  if params['Digits'] == '1'
    redirect '/lesson/1'
  elsif params['Digits'] == '2'
    redirect '/'
  end.text
end

get '/lesson/5' do
  Twilio::TwiML::Response.new do |r|
    r.Say 'Ending a relationship may be one of the toughest things to do, but sometimes it is for the best.  This lesson will definitely help you let a little bit of it out.'
    r.Play 'https://s3-us-west-2.amazonaws.com/skynyrd/1-03+Tuesday%27s+Gone.mp3'
    r.Say 'You made the right choice my friend. Now what would you like to do next?'
    r.Gather :numDigits => '1', :action => '/lesson/1/done', :method => 'get' do |g|
      g.Say 'Press 1 to hear the lesson again'
      g.Say 'Press 2 to go back to the main menu'
    end
  end.text
end

get '/lesson/5/done' do
  if params['Digits'] == '1'
    redirect '/lesson/1'
  elsif params['Digits'] == '2'
    redirect '/'
  end.text
end

get '/lesson/6' do
  Twilio::TwiML::Response.new do |r|
    r.Say 'We have all taken our licks from the damn economic crisis.  If you are still struggling let this lesson ease your pain.'
    r.Play 'https://s3-us-west-2.amazonaws.com/skynyrd/2-04+Mr.+Banker+(Single+Version).mp3'
    r.Say 'We can not put money in your pocket, but we can put a great lesson in your heart. What would you like to do next?'
    r.Gather :numDigits => '1', :action => '/lesson/1/done', :method => 'get' do |g|
      g.Say 'Press 1 to hear the lesson again'
      g.Say 'Press 2 to go back to the main menu'
    end
  end.text
end

get '/lesson/6/done' do
  if params['Digits'] == '1'
    redirect '/lesson/1'
  elsif params['Digits'] == '2'
    redirect '/'
  end.text
end

