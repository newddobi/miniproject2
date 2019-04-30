package com.model2.mvc.web.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;


@Controller
public class ProductController {

		@Autowired
		@Qualifier("productServiceImpl")
		private ProductService productService;

		public ProductController() {
			System.out.println(this.getClass());
		}
		
		@Value("#{commonProperties['pageUnit']}")
		//@Value("#{commonProperties['pageUnit'] ?: 3}")
		int pageUnit;
		
		@Value("#{commonProperties['pageSize']}")
		//@Value("#{commonProperties['pageSize'] ?: 2}")
		int pageSize;
		
		@RequestMapping("/addProductView.do")
		public String addProductView() throws Exception {

			System.out.println("/addProductView.do");
			
			return "redirect:/product/addProductView.jsp";
		}
		
		@RequestMapping("/addProduct.do")
		public String addProduct( @ModelAttribute("product") Product product ) throws Exception {

			System.out.println("/addProduct.do");
			
			productService.addProduct(product);
			
			return "forward:/product/addProduct.jsp";
		}
		
		@RequestMapping("/getProduct.do")
		public String getProduct( @RequestParam("prodNo") int prodNo , Model model ) throws Exception {
			
			System.out.println("/getProduct.do");
			
			Product product = productService.getProduct(prodNo);
			
			model.addAttribute("product", product);
			
			return "forward:/product/readProduct.jsp";
		}
		
}
