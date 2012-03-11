require 'sheldon_cooper'

def getTime &tocall
  a = Time.now
  tocall.call
  Time.now - a
end

describe SheldonCooper, '.new' do
  it "initiates a table of all known words" do
    SheldonCooper.new
    SheldonCooper.new
  end
end

describe SheldonCooper, '.correctorizor' do
  it "corrects words teehee" do
  end
end

describe SheldonCooper, '.cor_wrap' do
  it "calls correctorizor and uses a nice format to output" do
    SheldonCooper.new
    p SheldonCooper.cor_wrap "through"
    p SheldonCooper.cor_wrap "throuhg"
    p SheldonCooper.cor_wrap "passwrd"
  end
end

describe SheldonCooper, '.score' do
  it "compares two words and scores them" do
    SheldonCooper.new
    p SheldonCooper.score("through", "throuhg")
  end
end

describe SheldonCooper, '.combinations' do
  it "finds all the combinations of a single word" do
    SheldonCooper.new
    SheldonCooper.combinations("true").include?("ru").should eql(true)
  end
end
