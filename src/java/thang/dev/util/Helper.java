package thang.dev.util;

import java.util.List;
import thang.dev.data.model.OrderItem;

/**
 *
 * @author Bắp
 */
public class Helper {

    public static double total(List<OrderItem> orderItemList) {
        double total = 0;
        for (int i = 0; i < orderItemList.size(); i++) {
            OrderItem ord = orderItemList.get(i);  // Lấy từng phần tử trong danh sách
            total += ord.getPrice() * ord.getQuantity();  // Tính tổng giá trị cho mỗi sản phẩm
        }
        return total;
    }

}
