package tdtu.edu.controller;

import tdtu.edu.Service.ParamService;
import tdtu.edu.Service.SessionService;
import tdtu.edu.dao.AccountDAO;
import tdtu.edu.dao.OderDetailDAO;
import tdtu.edu.dao.OrderDAO;
import tdtu.edu.dao.ProductDAO;
import tdtu.edu.model.Account;
import tdtu.edu.model.Order;
import tdtu.edu.model.OrderDetail;
import tdtu.edu.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Controller
public class HomeController {
    @Autowired
    ProductDAO dao;
   @Autowired
    AccountDAO accountDAO;
   @Autowired
    OrderDAO orderDAO;
   @Autowired
    OderDetailDAO oderDetailDAO;
   @Autowired
    SessionService sessionService;
   @Autowired
    ParamService paramService;
   @RequestMapping("")
   public String view(Model model ,@RequestParam("p") Optional<Integer> p){
       Product item = new Product();
       model.addAttribute("item",item);
       Pageable pageable = PageRequest.of(p.orElse(0), 10);
       Page<Product> page = dao.findAll(pageable);
       model.addAttribute("page", page)    ;
       return "layoutchange/body";
   }
    @RequestMapping("/Home/views")
    public String views(Model model ,@RequestParam("p") Optional<Integer> p){
        Product item = new Product();
        model.addAttribute("item",item);
       
        Pageable pageable = PageRequest.of(p.orElse(0), 10);
        Page<Product> page = dao.findAll(pageable);
        model.addAttribute("price",item.getPrice());
        model.addAttribute("page", page)    ;
        return "layoutchange/body";
    }
    @RequestMapping("/Home/contact")
    public String contact(){
        return "layoutchange/contact";
    }
    @RequestMapping("/Home/Account/Edit/{id}")
    public String AccountEdit( Model model, @PathVariable("id") String username){
        Account item = accountDAO.findAccountByUsername(username);
        model.addAttribute("item", item);
        List<Account> items = accountDAO.findAll();
        model.addAttribute("items", items);
        return "layoutchange/settingaccount";
    }
    @RequestMapping("/Home/Account/Update")
    public String UpdateSomething(@Validated @ModelAttribute("item")  Account item, BindingResult errors , Model model) throws IOException {
        if(errors.hasErrors()){
         model.addAttribute("message","Some field are not valid . Please fix them");
        }else {
        accountDAO.save(item);
        model.addAttribute("message", "Edit Success");
        model.addAttribute("item", new Product());
        }
        return  "redirect:/Home/views";
    }
    @RequestMapping("/Home/YourCart/{id}")
    public String YourCart(Model model , @PathVariable("id") Long id){
         List<Order> items = orderDAO.findAllByAccount_Id( id);
         model.addAttribute("items",items);
        return "layoutchange/YourCart";
    }
    @RequestMapping("/Home/YourCart/Details/{id}")
    public String Details(Model model , @PathVariable("id") Long id){
        List<OrderDetail> items = oderDetailDAO.findAllByOrder_Id(id);
        model.addAttribute("items",items);
        return "layoutchange/CartDetails";
    }
    @RequestMapping("/Home/YourCart/Cancel/{id}")
    public String Cancel(Model model,@PathVariable("id") Long id){
        List<Order> item = orderDAO.findAllById(id);
        for(Order x : item) {
            if(x.getConfirm() == true) {
                model.addAttribute("message","You can't cancel your order because your status is confirmed");
            } else {
                x.setAvailable(false);
                orderDAO.save(x);
                model.addAttribute("message","Cancel success");
            }
        }
        model.addAttribute("items",item);
        return "layoutchange/YourCart";
    }

    @RequestMapping("/Home/account/change/{id}")
    public String password( Model model , @PathVariable("id") long id){
       Account item = accountDAO.findById(id);
        model.addAttribute("item", item);
        List<Account> items = accountDAO.findAll();
        model.addAttribute("items",items);
        return"layoutchange/changepassword";
    }
    @RequestMapping("/Home/account/change/password")
    public String passwordchange(@ModelAttribute("item") Account item,@RequestParam("old") String old,@RequestParam("newp") String newp, @RequestParam("confirm") String confirm, Model model ){
        Account account = accountDAO.findById(item.getId());
        if(item.getPassword().equals(old)){
            if(newp.equals("")){
                model.addAttribute("message","Please enter your password");
            }else{
                if(newp.equals(confirm)){
                    account.setId(item.getId());
                    account.setActivated(item.isActivated());
                    account.setAddress(item.getAddress());
                    account.setPassword(newp);
                    account.setAdmin(item.isAdmin());
                    account.setFullname(item.getFullname());
                    account.setUsername(item.getUsername());
                    account.setPhone(item.getPhone());
                    account.setUsername(item.getUsername());
                    accountDAO.save(account);
                    model.addAttribute("message","success full");
                }else{
                    model.addAttribute("message","New password aren't match Confirmpassword");
                }
            }
        }else {
            model.addAttribute("message","Your old password are not true");
        }
        return"layoutchange/changepassword" ;
    }


}
