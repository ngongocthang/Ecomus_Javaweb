package thang.dev.data.dao;

import java.util.List;

import thang.dev.data.model.Product;

public interface ProductDao {

    public int insert(Product product);

    public boolean update(Product product);

    public boolean delete(int id);

    public Product find(int id);

    public List<Product> findAll();

    public List<Product> hot(int limit);

    public List<Product> news(int limit);

    public List<Product> findByCategory(int id);

    public List<Product> findByName(String key);

    public List<Product> findByCategoryOfName(int categoryId, String key);

    public List<Product> filter(int categoryId, String propertyName, String order);

    public List<Product> relatedProductList(Product product);

    public List<Product> getProducts(int from, int amount);

// shop
    public List<Product> filterShop(String propertyName, String order);

    public List<Product> getProductsByCategory(int categoryId, int offset, int limit);

    public int countByCategory(int categoryId);
//

    public boolean updateView(Product product);

//    search
    public List<Product> findByNameAndFilter(String keyword, String property, String order);
//    

}
