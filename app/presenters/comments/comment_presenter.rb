module Comments
  class CommentPresenter < SimpleDelegator
    def initialize(model)
      @model = model
      super(@model)
    end

    # get comment's creation date and time
    # @return: [String] - comment creation date and time
    # formated as DD/MM/YYYY at HH:MM AM/PM
    def created_date_time
      @model.created_at.strftime('%d/%m/%Y at %I:%M%p')
    end
  end
end