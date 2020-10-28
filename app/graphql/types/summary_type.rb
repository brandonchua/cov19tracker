module Types
  class SummaryType < Types::BaseObject
    field :total_cases, Integer, null: false
    field :total_deaths, Integer, null: false
    field :total_recovered, Integer, null: false
  

  def request
    base_url = "https://corona.lmao.ninja/v3/covid-19/all"
    request = HTTParty.get(base_url).body
    response = JSON.parse(request)
  end
  
  def total_cases
    request["cases"]
  end

  def total_deaths
    request["deaths"]
  end

  def total_recovered
    request["recovered"]
  end
 end
end
