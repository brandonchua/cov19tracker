module Types
  class CountryType < Types::BaseObject
    field :id, ID, null: false
    field :country_name, String, null: true
    field :cases, Integer, null: false # from here to line 12 are auto generated fields
   field :cases_today, Integer, null: false
   field :deaths, Integer, null: false
   field :deaths_today, Integer, null: false
   field :recovered, Integer, null: false
   field :active, Integer, null: false
   field :critical, Integer, null: false
   field :last_updated_at, Integer, null: false
   
  def request # create a function that queries an external API and stores the response 
    base_url = "https://corona.lmao.ninja/v3/covid-19/countries/#{object.country_name}"
    request = HTTParty.get(base_url).body
  end

   def cases # this function gets the results for the cases column/field
      response = JSON.parse(request)["cases"]
    end

    def cases_today
      response = JSON.parse(request)["todayCases"]
    end

    def deaths
      response = JSON.parse(request)["deaths"]
    end

    def deaths_today
      response = JSON.parse(request)["todayDeaths"]
    end

    def recovered
      response = JSON.parse(request)["recovered"]
    end

    def active
      response = JSON.parse(request)["active"]
    end

    def critical
      response = JSON.parse(request)["critical"]
    end

    def last_updated_at
      response = JSON.parse(request)["updated"]
    end

  end
end
