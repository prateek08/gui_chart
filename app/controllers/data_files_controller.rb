class DataFilesController < ApplicationController
	def index
	end

  def new
  end


	def create
	require 'fileutils'
  	tmp1 = params[:data_file][:src].tempfile
  	source = Rails.root.join('public', 'uploads', "file1")
   	FileUtils.cp tmp1.path, source

	 tmp2 = params[:data_file][:dest].tempfile
  	destination = Rails.root.join('public', 'uploads', "file2")
   	FileUtils.cp tmp2.path, destination

     #file1 = Rails.root.join('public', 'uploads', "file1")
    f1 = File.open(source, "r")
    line = f1.readline
    line = line.chomp
    @header = line.scan( /([^",]+)|"([^"]+)"/ ).flatten.compact

   # file2 = Rails.root.join('public','uploads',"file2")
    f2 = File.open(destination, "r")
    line = f2.readline
    @map_header = line.scan( /([^",]+)|"([^"]+)"/ ).flatten.compact
   	#tmp3 = params[:data_file][:parameter].tempfile
  	#parameter_file = Rails.root.join('public', 'uploads', params[:data_file][:parameter].original_filename)
   	#FileUtils.cp tmp3.path, parameter_file

   	tmp4 = params[:data_file][:perl_script].tempfile
  	script = Rails.root.join('public', 'uploads', "script")
   	FileUtils.cp tmp4.path, script
   	#perl_command = "perl.exe \"#{script}\" \"#{source}\" \"#{destination}\" \"#{parameter_file}\" > \".\\public\\output\\perl_output.txt\""
   	#system(perl_command)
	 
  end

  def table
  end

	def show
	end

  def parameters
    file1 = Rails.root.join('public', 'uploads', "file1")
    f1 = File.open(file1, "r")
    line = f1.readline
    line = line.chomp
    @header = line.scan( /([^",]+)|"([^"]+)"/ ).flatten.compact

    file2 = Rails.root.join('public','uploads',"file2")
    f2 = File.open(file2, "r")
    line = f2.readline
    @map_header = line.scan( /([^",]+)|"([^"]+)"/ ).flatten.compact
  end

  def accept_parameters
    file1 = Rails.root.join('public', 'uploads', "file1")
    f1 = File.open(file1, "r")
    line = f1.readline
    line = line.chomp
    header = line.scan( /([^",]+)|"([^"]+)"/ ).flatten.compact

     file2 = Rails.root.join('public','uploads',"file2")
    f2 = File.open(file2, "r")
    line = f2.readline
    line = line.chomp
    map_header = line.scan( /([^",]+)|"([^"]+)"/ ).flatten.compact


    params_file = Rails.root.join('public', 'uploads', "params_file")
    f3 = File.open(params_file, 'w')
    count = 0;
    header.each do |x|
      string = x
      temp_string = params[:data_files][x]
      if ( temp_string != nil)
        temp_string_index = map_header.index(temp_string).to_s
      else
        temp_string_index = ""
      end
      string << "," << count.to_s << ",,,"
      count = count +1
      string << temp_string.to_s << "," << temp_string_index << ",,"

      f3.puts string  
     end

     f4 = File.open(Rails.root.join('public', 'uploads', "tmp"), "w")
     
     tp1 = params[:primary_key_file1].join(",")
     tp2 = params[:primary_key_file2].join(",")
     
     script = Rails.root.join('public', 'uploads', "script")
     
     perl_command = "perl.exe \"#{script}\" \"#{file1}\" \"#{file2}\" \"#{tp1}\" \"#{tp2}\" \"#{params_file}\" > \".\\public\\output\\perl_output.txt\""
      f4.puts perl_command     
    #system(perl_command)
  end

  def primary_keys
  end  

end
