class CsvimportersController < ApplicationController
    include CsvimportersHelper
    helper_method :sort_column, :sort_
  
    def index
      @csvimporters = Csvimporter.search(csvimporter_params[:search])
                         .order(sort_column + " " + sort_direction)
                         .paginate(:per_page => 30, :page => csvimporter_params[:page])
    end
  
    def show
      if(params["commit"]=='Upload Data')
        print "\n\n\n\n\n\n\n>>>>>>>>>>>>>STRT Upload"
        #Csvimporter.all.each do |csvimprtr|
        #  mapping = Mapping.find_or_create_by(mapping_str:csvimprtr.mapping)
        #  mapping.save
    
        #  role = Role.find_or_create_by(role_str:csvimprtr.role)
        #  role.save
    
        #  question = Question.new(mapping_id: mapping.id, role_id:role.id, appearsDay: csvimprtr.appears, pri: csvimprtr.pri, 
        #      quiz: csvimprtr.question, teamingStages: csvimprtr.teaming, frequency: csvimprtr.frequency, 
        #      qType: csvimprtr.qtype, required: csvimprtr.required, conditions: csvimprtr.conditions);
        #  question.save
        #  csvimprtr.destroy
        #end
  
        redirect_to root_url, notice: "Data Has been Move to Main table, See on React Client"    
      end
  
      if(params["commit"]=='Clean Data')
        print "\n\n\n\n\n\n\n>>>>>>>>>>>>>STRT DELETEEEEEEE"
        Csvimporter.destroy_all
        redirect_to root_url, notice: "Temp Data Has been clear."
      end
      
    end
  
    def import
      # Validate inputs with block
      begin
        file = csvimporter_params[:file]
        file_path = file.path
        Csvimporter.import(file_path)
        redirect_to root_url, notice: "Csvimporters imported."
      rescue
        redirect_to root_url, notice: "Invalid CSV file format."
      end
    end
  
    private
  
    def sort_column
      Csvimporter.column_names.include?(csvimporter_params[:sort]) ? csvimporter_params[:sort] : "pri"
    end
  
    def sort_direction
      %w[asc desc].include?(csvimporter_params[:direction]) ? csvimporter_params[:direction] : "asc"
    end
  
    def csvimporter_params
      params.permit(:id, :pri, :question, :teaming, :appears, :frequency, :qtype, :role, :required, :conditions, :mapping,
                    :file, :search, :page, :sort, :utf8, :sessionid,
                    :authenticity_token, :commit, :direction, :_)
    end
  
  end
  