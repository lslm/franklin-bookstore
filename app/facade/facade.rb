class Facade
  def index
    dao = CategoryDao.new
    dao.index
  end

  def show(id)
    dao = CategoryDao.new
    dao.show(id)
  end

  def create(params)
    dao = CategoryDao.new
    dao.create(params)
  end

  def update(id, params)
    dao = CategoryDao.new
    dao.update(id, params)
  end

  def destroy(id)
    dao = CategoryDao.new
    dao.destroy(id)
  end
end