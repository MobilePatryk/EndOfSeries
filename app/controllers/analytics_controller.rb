class AnalyticsController < ApplicationController
    before_action :fresh_token,:init
    
    def account_summaries
        @account_summaries = @service.list_account_summaries
        byebug
       
    end
    
    def analytics_data(profile_id,start_date,end_date,metrics,dimensions,options = {})
        profile_id = 'ga:26151056'

        start_date = '2017-10-01'

        end_date = '2017-10-31'

        metrics = 'ga:searchUniques'
        
        dimensions = options["dimensions"]
        
        filters = options["filters"]
        
        max_results = options["max_results"]
        
        segment = options["segment"]
        
        sort = options["sort"]
        
        @service.get_ga_data(profile_id, start_date, end_date, metrics, {
            :max_results => max_results,
            :dimensions => dimensions,
            :filters => filters,
            :segment => segment,
            :sort => sort
        })
        
    end
    
    private 
    
    def init
        byebug
        @service = Google::Apis::AnalyticsV3::AnalyticsService.new
        @service.authorization = main_user.oauth_token
    end
    
    def fresh_token
        main_user.refresh! # if current_user.expired?
    end
    
end
