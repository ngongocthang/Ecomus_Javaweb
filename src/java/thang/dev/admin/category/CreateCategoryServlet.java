package thang.dev.admin.category;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import thang.dev.admin.BaseAdminServlet;
import thang.dev.data.dao.CategoryDao;
import thang.dev.data.dao.DatabaseDao;
import thang.dev.data.dao.ProductDao;
import thang.dev.data.model.Category;
import thang.dev.data.model.Product;
import thang.dev.data.model.User;

/**
 *
 * @author Bắp
 */
@MultipartConfig
public class CreateCategoryServlet extends BaseAdminServlet {

    @Override
    protected void handleGet(HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {

        request.getRequestDispatcher("admin/category/create.jsp").include(request, response);
    }

    @Override
    protected void handlePost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
 

        // Xử lý file upload và lưu đường dẫn ảnh
        String thumbnailPath = saveThumbnail(request);

        CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();
        Category category = new Category(name, thumbnailPath);
        categoryDao.insert(category);

        response.sendRedirect("IndexCategoryServlet");
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
