require 'fastercsv'

class HomeController < ApplicationController
  def home
    
  end

  def parse
    csv = params[:csv]
    p csv
    FasterCSV.parse(csv, :headers => true) do |row|
      p row['key'] + ' => ' + row['value']
    end
  end
end
