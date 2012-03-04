namespace :populate do
  desc "Load Hiring Managers' data from file"
    task :routes => :environment do |t|
      require 'csv'

      RouteAssignment.all.each {|ra| ra.destroy}

      routes_file_path = "#{File.dirname(__FILE__)}/routeassignment.csv"
      info_log t, "Opening data file #{routes_file_path}"

      unless File.exists?(routes_file_path)
        info_log t, "#{routes_file_path} does not exist!"
        puts "#{routes_file_path} does not exist!"
        exit
      end

      # Get hiring manager data
      parsed_ra_data = CSV.parse(File.open(routes_file_path, 'r'),
                 {headers:true, header_converters:[:symbol], col_sep:','})
      
      parsed_ra_data.each do |row|
        h = row.to_hash
        route_assignment = RouteAssignment.create(lat: h[:lat], lon: h[:long], route_number: h[:route])
      end
    end

    def info_log(t, msg)
      Rails.logger.info "*** #{t.name} [#{t.timestamp.strftime("%F %T")}] #{msg}"
    end

end