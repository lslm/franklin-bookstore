class CreateCommand
  def execute(params)
    Facade.new.create(params)
  end
end