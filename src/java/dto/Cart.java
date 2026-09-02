/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author naman
 */
public class Cart {
    
    private Map<String ,Integer> cart;
    public Cart(){
        this.cart = new HashMap<>();
    }
    public void additems(String product_Id)
    {
        cart.put(product_Id, cart.getOrDefault(product_Id,0)+1);
    }
    public void removeItems(String product_Id)
    {
        cart.remove(product_Id);
    }
    public void updateQuantity(String product_Id,int quantity)
    {
        if(quantity>0)
        {
            cart.put(product_Id, quantity);
        }
        else
        {
            removeItems(product_Id);
        }
    }
    public Map<String,Integer> getItems()
    {
        return cart;
    }
    public int getTotalItems()
    {
        return cart.values().stream().mapToInt(Integer::intValue).sum();
    }
    
}
