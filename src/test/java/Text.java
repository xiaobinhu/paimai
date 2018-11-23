import com.baizhi.spring.Test;
import com.baizhi.spring.entity.Product;
import com.baizhi.spring.service.ProductService;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(value = SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = Test.class)

public class Text {
    @Autowired
    private ProductService productService;
    @org.junit.Test
    public void  m1(){
        List<Product> products = productService.selectAll();
        for(Product p:products){
            System.out.println(p);

        }

    }
}
