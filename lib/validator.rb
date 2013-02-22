class TheValidator
  attr_reader :name, :email, :text, :phone

  def initialize(attributes = {})
    @name = attributes[:name] || ""
    @email = attributes[:email] || ""
    @text = attributes[:text] || ""
    @phone = attributes[:phone] || ""
    @errors = {}
  end

  def validate_all
    validation_passed = true

    validations = ['validate_name?', 'validate_email?', 'validate_text?', 'validate_phone?']
    validations.each do |validation_method_name|
      if !self.send(validation_method_name.to_sym)
        validation_passed = false
      end
    end

    if validation_passed
      return { valid: true, errors: @errors }
    else
      return { valid: false, errors: @errors }
    end
  end

  def validate_name?
    case
    when @name.empty?
      @errors[:name_err] = "Name is empty"
      return false
    when @name.match(/\A[a-z ,.'-]+\z/i)
      return true
    else
      @errors[:name_err] = "Name is not valid"
      return false
    end
  end

  def validate_email?
    case
    when @email.empty?
      @errors[:email_err] = "Email is empty"
      return false
    when @email.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
      return true
    else
      @errors[:email_err] = "Email is not valid"
      return false
    end
  end

  def validate_text?
    if @text.empty?
      @errors[:text_err] = "Text is empty"
      return false
    else
      return true
    end
  end

  def validate_phone?
    if @phone.empty?
      @errors[:phone_err] = "Phone number is empty"
      return false
    elsif @phone.match(/\A\+?\d?-?\(?\d{3}\)?-?\d{3}-?\d{4}\z/)
      return true
    else
      @errors[:phone_err] = "Phone number is not valid"
    end
  end

  
end

