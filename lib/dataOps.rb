#Read file to hash, strip end of line
def file2Mtx(inFile,separator)
  file = File.new(inFile,'r')
  returnMatrix = Hash.new
  lines = 0
  y = 0
  while  (line = file.gets)
    if lines > 0
      returnMatrix[y] = line.strip.split(separator)
      y+=1
    end
    lines+=1
  end
  file.close
  return returnMatrix
end

#Convert strings in hash of arrays to floats
def mtx2num(matrix)
  matrix.each_entry{|key,array|
    matrix[key] = array.map do |value|
      begin
       Float(value) 
      rescue
        msg =  "Error: \""+value+"\" cannot be converted to a float.
        Use some other method to convert strings to numbers before
        converting the whole array.
        For example adjustWeekDay(matrix, column) or adjustMonth(matrix,column)."
        abort(msg)
      end
    end 
  }
  return matrix
end


#Adjust "mon" to 1 etc Hash of arrays
def adjustWeekDay(matrix,column)
  matrix.each{|key,array|
    case array[column]
    when "mon"
      array[column] = 1
    when "tue"
      array[column] = 2
    when "wed"
      array[column]= 3
    when "thu"
      array[column]= 4
    when "fri"
      array[column] = 5
    when "sat"
      array[column] = 6
    when "sun"
      array[column] = 7
    end
  }
  return matrix
end

#Adjust "jan" to 1 etc Hash of arrays
def adjustMonth(matrix,column)

  matrix.each{|key,array|
    case array[column]
    when "jan"
      array[column] = 1
    when "feb"
      array[column] = 2
    when "mar"
      array[column] = 3
    when "apr"
      array[column] = 4
    when "may"
      array[column] = 5
    when "jun"
      array[column] = 6 
    when "jul"
      array[column] = 7
    when "aug"
      array[column]  = 8
    when "sep"
      array[column] = 9
    when "oct"
      array[column] = 10
    when "nov"
      array[column] = 11
    when "dec"
      array[column] = 12
    end
  }
  return matrix
end
