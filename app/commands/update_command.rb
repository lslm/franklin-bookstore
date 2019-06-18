class UpdateCommand
  def execute(id, params)
    Facade.new.update(id, params)
  end
end
