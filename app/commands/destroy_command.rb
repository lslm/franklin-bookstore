class DestroyCommand
  def execute(id)
    Facade.new.destroy(id)
  end
end
