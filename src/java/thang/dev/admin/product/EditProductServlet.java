package thang.dev.admin.product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
public class EditProductServlet extends BaseAdminServlet {

    @Override
    protected void handleGet(HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        ProductDao productDao = DatabaseDao.getInstance().getProductDao();
        Product product = productDao.find(productId);
        CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();
        List<Category> categoryList = categoryDao.findAll();

        request.setAttribute("categoryList", categoryList);
        request.setAttribute("product", product);
        request.getRequestDispatcher("admin/product/edit.jsp").include(request, response);
    }

    @Override
    protected void handlePost(HttpServletRequest request, HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        ProductDao productDao = DatabaseDao.getInstance().getProductDao();
        Product product = productDao.find(productId);

        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int category_id = Integer.parseInt(request.getParameter("category_id"));

        // Lưu đường dẫn hình ảnh cũ
        String oldThumbnail = product.getThumbnail();

        // Kiểm tra xem có hình ảnh mới được tải lên không
        Part filePart = request.getPart("thumbnail");

        if (filePart != null && filePart.getSize() > 0) {
            // Nếu có hình ảnh mới, xóa hình ảnh cũ nếu tồn tại
            if (oldThumbnail != null && !oldThumbnail.isEmpty()) {
                String oldThumbnailPath = getServletContext().getRealPath("/storage") + File.separator + oldThumbnail;
                File oldFile = new File(oldThumbnailPath);
                if (oldFile.exists()) {
                    if (oldFile.delete()) {
                        System.out.println("Đã xóa hình ảnh cũ: " + oldThumbnailPath);
                    } else {
                        System.out.println("Không thể xóa hình ảnh cũ: " + oldThumbnailPath);
                    }
                }
            }

            // Lưu hình ảnh mới
            String newThumbnailPath = saveThumbnail(request, filePart);
            product.setThumbnail(newThumbnailPath);
        } else {
            // Giữ lại hình ảnh cũ nếu không có hình ảnh mới
            product.setThumbnail(oldThumbnail);
        }

        product.setName(name);
        product.setDescription(description);
        product.setPrice(price);
        product.setQuantity(quantity);
        product.setCategoryId(category_id);

        productDao.update(product);
        response.sendRedirect("IndexProductServlet?message=Category Updated successfully!");
    }

    private String saveThumbnail(HttpServletRequest request, Part filePart) {
        String thumbnailPath = null;

        // Đường dẫn để lưu trữ
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
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String fullFilePath = uploadDir + File.separator + fileName;

            // Lưu tệp vào thư mục
            filePart.write(fullFilePath);

            // Kiểm tra xem tệp đã được lưu thành công không
            File savedFile = new File(fullFilePath);
            if (savedFile.exists()) {
                System.out.println("Tệp đã được lưu tại: " + fullFilePath);
            } else {
                System.out.println("Không thể lưu tệp hình ảnh.");
            }

            // Trả về đường dẫn tương đối để lưu vào cơ sở dữ liệu
            thumbnailPath = fileName;

        } catch (IOException e) {
            System.out.println("Lỗi khi lưu tệp hình ảnh: " + e.getMessage());
            e.printStackTrace();
        }

        return thumbnailPath;  // Trả về đường dẫn tương đối
    }
}
