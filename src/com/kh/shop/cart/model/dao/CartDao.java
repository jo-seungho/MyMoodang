package com.kh.shop.cart.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class CartDao {

    private Properties prop = new Properties();

    public CartDao() {
        String fileName = CartDao.class.getResource("/sql/cart/cart-mapper.xml").getPath();
        try {
            prop.load(new FileReader(fileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // public

}


