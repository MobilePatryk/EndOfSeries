require 'google/apis/analytics_v3'

@service = Google::Apis::AnalyticsV3::AnalyticsService.new

@service.authorization = User.first.oauth_token

profile_id = 'ga:26151056'

start_date = '2017-10-01'

end_date = '2017-10-31'

sort = "-ga:pageviews"

dimensions = "ga:dimension14"

metrics = "ga:pageviews"


data = @service.get_ga_data(profile_id, start_date, end_date, metrics, {
            :dimensions => dimensions,
            :sort => sort
        })


data.rows.each do |i|
	s = Sport.new
	puts i[0]
	if !i[0].include? "??"
	s.name = i[0]
	s.save
    end
end