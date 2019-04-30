package com.model2.mvc.web.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;

import com.model2.mvc.service.product.impl.ProductServiceImpl;

@Controller
public class ProductController {

		@Autowired
		@Qualifier("productServiceImpl")
		private ProductServiceImpl productService;

		public ProductController() {
			System.out.println(this.getClass());
		}
		
		@Value("#{commonProperties['pageUnit']}")
		//@Value("#{commonProperties['pageUnit'] ?: 3}")
		int pageUnit;
		
		@Value("#{commonProperties['pageSize']}")
		//@Value("#{commonProperties['pageSize'] ?: 2}")
		int pageSize;
		
		
}
