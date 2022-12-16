package tdtu.edu.controller;

import tdtu.edu.Service.ShoppingCartService;
import tdtu.edu.dao.OderDetailDAO;
import tdtu.edu.dao.OrderDAO;
import tdtu.edu.dao.ProductDAO;
import tdtu.edu.model.CartItem;
import tdtu.edu.model.Order;
import tdtu.edu.model.OrderDetail;
import tdtu.edu.model.Product;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Collection;
import java.util.List;

@Controller
public class ShoppingCartController {
    @Autowired
    ProductDAO dao;
    @Autowired
    OrderDAO oder;
    @Autowired
    OderDetailDAO orderDetails;
    @Autowired
    ShoppingCartService shoppingCartService;

    @RequestMapping(value = "/shoppingcart/add/{id}" )
    public String add(Model model ,@PathVariable("id") Long id){
//       Product product = dao.findById(id).get();
        Product product = dao.findById(Math.toIntExact(id));
        List<Product> list = dao.findAll();
        CartItem  item = new CartItem ();
            BeanUtils.copyProperties(product,item);
            item.setQuantity(1);
        item.setId(product.getId());
        shoppingCartService.add(item);
        return "redirect:/shoppingcart/index";
    }
    @RequestMapping("/shoppingcart/index")
    public String index(Model model){
        Collection<CartItem>  cartItems = shoppingCartService.getCartItems();
        model.addAttribute("items",cartItems);
        model.addAttribute("total",shoppingCartService.getAmount());
        model.addAttribute("NoOfItem",shoppingCartService.getCount());
        return "layoutchange/ItemCart";
    }

    @RequestMapping("/shoppingcart/save")
    public String checkout(Model model ,@ModelAttribute("item") Order item ){
        Collection<CartItem>  cart = shoppingCartService.getCartItems();
        model.addAttribute("items",cart);
        model.addAttribute("total",shoppingCartService.getAmount());
        model.addAttribute("NoOfItem",shoppingCartService.getCount());
        return "layoutchange/checkform";
    }
    @RequestMapping("/shoppingcart/save/order")
    public String saveorder(Model model ,@ModelAttribute("item") Order item ){
    	
    	 
    	
        Collection<CartItem>  carts = shoppingCartService.getCartItems();
        Product prd = new Product();
        double pricee=0;
        for(CartItem x : carts){
            OrderDetail items = new OrderDetail();
            //Product prd = dao.findAllById(x.getId());
            prd.setId(x.getId());
            items.setQuantity(x.getQuantity());
            items.setOrder(item);
            items.setPrice(x.getPrice());
            items.setProduct(prd);
            Product product = dao.findAllById(x.getId());
            pricee+=x.getPrice()*x.getQuantity();
           
           
            if(product.getQuantity() < x.getQuantity()){
                model.addAttribute("message","This product just have "+product.getQuantity());
            }else{
            	item.setPrice(pricee);
            	item.setAvailable(true);
            	item.setConfirm(false);
            	 oder.save(item);
                orderDetails.save(items);
                product.setQuantity(product.getQuantity()-items.getQuantity());
                dao.save(product);
                model.addAttribute("message", "Order Success");

            }
        }
        return "layoutchange/checkform";
    }

    @RequestMapping("/remove/{id}")
    public String remove(@PathVariable("id") Integer id){
        shoppingCartService.remove(id);
        return "redirect:/shoppingcart/index";
    }
    @RequestMapping("/shoppingcart/update")
    public String update(@RequestParam("id") Integer id,@RequestParam("quantity") Integer quantity){
        shoppingCartService.update(id,quantity);
        return "redirect:/shoppingcart/index";
    }
    @RequestMapping("/Checkout/Save")
    public String CheckoutAdd(Model model, @ModelAttribute("order") Integer order){

        return "redirect:/shoppingcart/index";
    }



}
