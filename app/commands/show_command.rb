class ShowCommand
  def execute(id)
    Facade.new.show(id)
  end
end