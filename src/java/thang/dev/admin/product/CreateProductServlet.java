package thang.dev.admin.product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;
import thang.dev.admin.BaseAdminServlet;
import thang.dev.data.dao.CategoryDao;
import thang.dev.data.dao.DatabaseDao;
import thang.dev.data.dao.ProductDao;
import thang.dev.data.model.Category;
import thang.dev.data.model.Product;

/**
 *
 * @author Bắp
 */
@MultipartConfig
public class CreateProductServlet extends BaseAdminServlet {

    @Override
    protected void handleGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();
        List<Category> categoryList = categoryDao.findAll();

        request.setAttribute("categoryList", categoryList);
        request.getRequestDispatcher("admin/product/create.jsp").include(request, response);
    }

    @Override
    protected void handlePost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int category_id = Integer.parseInt(request.getParameter("category_id"));

        // Xử lý file upload và lưu đường dẫn ảnh
        String thumbnailPath = saveThumbnail(request);

        ProductDao productDao = DatabaseDao.getInstance().getProductDao();
        Product product = new Product(name, description, thumbnailPath, price, quantity, category_id);
        productDao.insert(product);

        response.sendRedirect("IndexProductServlet");
    }

   private String saveThumbnail(HttpServletRequest request) {
    String thumbnailPath = null;
    
    // Đường dẫn thực tế trên server để lưu ảnh
    String uploadDir = getServletContext().getRealPath("/storage");  
    
    File dir = new File(uploadDir);
    if (!dir.exists()) {
        if (dir.mkdirs()) {
            System.out.println("Thư mục lưu trữ đã được tạo: " + uploadDir);
        } else {
            System.out.println("Không thể tạo thư mục lưu trữ.");
        }
    }

    try {
        Part filePart = request.getPart("thumbnail");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        
        // Lưu file vào thư mục thực tế
        String fullFilePath = uploadDir + File.separator + fileName;
        filePart.write(fullFilePath);
        
        // Kiểm tra xem file có được lưu thành công không
        File savedFile = new File(fullFilePath);
        if (savedFile.exists()) {
            System.out.println("Tệp đã được lưu tại: " + fullFilePath);
        } else {
            System.out.println("Không thể lưu tệp hình ảnh.");
        }

        // Trả về đường dẫn tương đối cho cơ sở dữ liệu (đường dẫn này sẽ lưu vào DB)
        thumbnailPath = fileName;

    } catch (IOException | ServletException e) {
        System.out.println("Lỗi khi lưu tệp hình ảnh: " + e.getMessage());
        e.printStackTrace();
    }

    return thumbnailPath;  // Trả về đường dẫn tương đối
}


}
