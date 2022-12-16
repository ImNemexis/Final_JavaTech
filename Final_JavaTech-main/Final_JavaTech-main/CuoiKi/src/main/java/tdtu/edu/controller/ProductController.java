package tdtu.edu.controller;

import tdtu.edu.Service.SessionService;
import tdtu.edu.dao.CategoryDAO;
import tdtu.edu.dao.ProductDAO;
import tdtu.edu.model.Category;
import tdtu.edu.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Locale;
import java.util.Optional;

@Controller

public class ProductController {
    @Autowired
    ProductDAO dao;
    @Autowired
    CategoryDAO catedao;
    @Autowired
    SessionService session;

    @RequestMapping("/Home/product")
    public String product(Model model, @RequestParam("p") Optional<Integer> p){
        List<Category> categories = catedao.findAll();
        model.addAttribute("categories",categories);
        Pageable pageable = PageRequest.of(p.orElse(0), 8);
        Page<Product> page = dao.findAll(pageable);
        model.addAttribute("page", page)    ;
        return "layoutchange/products";
    }
    @RequestMapping("/Home/product/sort")
    public String productsort(Model model, @RequestParam("p") Optional<Integer> p , @RequestParam("field") Optional<String> field){
        Sort sort = Sort.by(Sort.Direction.ASC,field.orElse("price"));
        model.addAttribute("field",field.orElse("price").toUpperCase());

        List<Category> categories = catedao.findAll();
        model.addAttribute("categories",categories);
        Pageable pageable = PageRequest.of(p.orElse(0), 8,Sort.Direction.ASC,field.orElse("price"));
        Page<Product> page = dao.findAll(pageable);
        model.addAttribute("page", page);
        return "layoutchange/products";
    }
    @RequestMapping("/Home/product/sortdesc")
    public String productsortdesc(Model model, @RequestParam("p") Optional<Integer> p , @RequestParam("field") Optional<String> field){

        model.addAttribute("field",field.orElse("price").toUpperCase());

        List<Category> categories = catedao.findAll();
        model.addAttribute("categories",categories);
        Pageable pageable = PageRequest.of(p.orElse(0), 8,Sort.Direction.DESC,field.orElse("price"));
        Page<Product> page = dao.findAll(pageable);
        model.addAttribute("page", page);
        return "layoutchange/products";
    }
    @RequestMapping("/Home/product/about/{id}")
    public String aboutproduct(Model model, @PathVariable("id") Long id){
        Product item = dao.findById(id);
        model.addAttribute("item", item);
        List<Product> items = dao.findAll();
        model.addAttribute("items", items);
        List<Product> pro = dao.findAllByCategoryId(item.getCategory().getId());
        model.addAttribute("procate",pro);
        return "layoutchange/aboutproduct";
    }
    @RequestMapping(value = "/Product/add/{id}" )
    public String add(@PathVariable("id") Long id , Model model , @RequestParam("p") Optional<Integer> p){

        model.addAttribute("style","color:red");
        List<Category> categories = catedao.findAll();
        model.addAttribute("categories",categories);
        Pageable pageable = PageRequest.of(p.orElse(0), 8);
        Page<Product> page = dao.findByCategoryId(id, pageable);
        model.addAttribute("page", page);
        return"layoutchange/products";
    }
    @RequestMapping("/product/search")
    public String searchAndPage(Model model, @RequestParam("keywords") Optional<String> kw, @RequestParam("p") Optional<Integer> p) {
        Product item = new Product();
        model.addAttribute("item",item);
        List<Category> categories = catedao.findAll();
        model.addAttribute("categories",categories);
        String kwords = kw.orElse(session.get("keywords"));
        session.set("keywords", kwords);
        Pageable pageable = PageRequest.of(p.orElse(0), 5);
        Page<Product> page = dao.findByNameLike("%"+kwords+"%", pageable);
        model.addAttribute("page", page);
        return "layoutchange/products";
    }
}
