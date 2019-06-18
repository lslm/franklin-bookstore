class CategoryDao
  def index
    Category.all.order('created_at ASC')
  end

  def show(id)
    Category.find(id)
  end

  def create(params)
    category = Category.new(params)
    category.save!
  end

  def update(id, params)
    category = Category.find(id)
    category.update!(params)
  end

  def destroy(id)
    category = Category.find(id)
    category.destroy!
  end
end
