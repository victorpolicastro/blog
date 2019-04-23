module Posts
  class PostPresenter < SimpleDelegator
    def initialize(model)
      @model = model
      super(@model)
    end

    # get post's creation date
    # @return: [String] - post creation date formated as DD/MM/YYYY
    def creation_date
      @model.created_at.strftime('%d/%m/%Y')
    end
  end
end
