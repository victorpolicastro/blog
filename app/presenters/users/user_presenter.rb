module Users
  class UserPresenter < SimpleDelegator
    def initialize(model)
      @model = model
      super(@model)
    end

    # get user's full name
    # @return: [String] - user's name and user's last name
    def full_name
      "#{@model.name} #{@model.last_name}"
    end

    # get user's initials
    # @return: [String] - user's name (first letter) and user's last name (first letter)
    def initials
      "#{@model.name[0]}#{@model.last_name[0]}"
    end
  end
end
