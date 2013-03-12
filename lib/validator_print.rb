module TheValidator
  class Print

    def initialize(object)
      @object = object
    end

    def print
      unless @object.errors.empty?
        puts number_of_errors
        @object.errors.each { |err| puts err }
      end
    end

    def number_of_errors
      if @object.errors.size == 1
        "There is #{@object.errors.size} error" 
      else
        "There are #{@object.errors.size} errors"
      end
    end 

  end

end
