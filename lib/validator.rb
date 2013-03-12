module TheValidator

  class Validate
    attr_reader :name, :email, :text, :phone, :errors

    def initialize(attributes = {})
      @name = attributes[:name] || ""
      @email = attributes[:email] || ""
      @text = attributes[:text] || ""
      @phone = attributes[:phone] || ""
      @errors = []
    end

    def valid_all?
      validation_passed = true

      validation_methods = ['valid_name?', 'valid_email?', 'valid_text?', 'valid_phone?']
      validation_methods.each do |validation_method_name|
        if !self.send(validation_method_name.to_sym)
          validation_passed = false
        end
      end

      if validation_passed
        return true
      else
        return false
      end
    end

    def valid_name?
      if @name.empty?
        @errors << "Name is empty"
        return false
      elsif @name.match(/\A[a-z ,.'-]+\z/i)
        return true
      else
        @errors << "Name is not valid"
        return false
      end
    end

    def valid_email?
      if @email.empty?
        @errors << "Email is empty"
        return false
      elsif @email.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
        return true
      else
        @errors << "Email is not valid"
        return false
      end
    end

    def valid_text?
      if @text.empty?
        @errors << "Text is empty"
        return false
      else
        return true
      end
    end

    def valid_phone?
      if @phone.empty?
        @errors << "Phone number is empty"
        return false
      elsif @phone.match(/\A\+?\d?-?\(?\d{3}\)?-?\d{3}-?\d{4}\z/)
        return true
      else
        @errors << "Phone number is not valid"
        return false
      end
    end

  end

end









