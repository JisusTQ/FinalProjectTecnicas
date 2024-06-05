/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.productsmongodbclass.infrastructure;

import com.mongodb.BasicDBObject;
import com.mongodb.MongoClientSettings;
import com.mongodb.ServerAddress;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import static com.mongodb.client.model.Filters.eq;
import com.mycompany.productsmongodbclass.models.Product;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.bson.Document;

/**
 *
 * @author Usuario
 */
public class ProductsMongoDB {

    private MongoDatabase dataBase;
    private MongoCollection<Document> collection;

    public ProductsMongoDB() {
        createConnection();
    }

    public MongoDatabase getDataBase() {
        return dataBase;
    }

    public void setDataBase(MongoDatabase dataBase) {
        this.dataBase = dataBase;
    }

    public MongoCollection<Document> getCollection() {
        return collection;
    }

    public void setCollection(MongoCollection<Document> collection) {
        this.collection = collection;
    }
    
    public boolean updateProduct(Product product){
        BasicDBObject basicDocument = new BasicDBObject();
        
        basicDocument.append("title", product.getTitle());
        basicDocument.append("description", product.getDescription());
        basicDocument.append("price", product.getPrice());
        basicDocument.append("brand", product.getBrand());
        basicDocument.append("category", product.getCategory());
        basicDocument.append("discountPercentage", product.getDiscountPercentage());
        
        BasicDBObject documentToUpdate = new BasicDBObject();
        documentToUpdate.append("id", product.getId());
        
        collection.updateOne(documentToUpdate, 
                new BasicDBObject().append("$set", basicDocument));
        
        return true;
    }   
    
    public boolean deleteProductById(int id) throws Exception{
        Document document = this.collection.find(eq("id", id)).first();
        
        if(document == null){
            throw new Exception();
        }
        
        BasicDBObject basicDocument = new BasicDBObject();
        basicDocument.append("id", id);
        
        collection.deleteOne(basicDocument);
        
        return true;
    }
    

    public Product getProductById(int id) {
        Document document = this.collection.find(eq("id", id)).first();
        
        Product product = new Product();
        product.setId(document.getInteger("id"));
        product.setTitle(document.getString("title"));
        product.setDescription(document.getString("description"));
        product.setPrice(document.getInteger("price"));
        product.setBrand(document.getString("brand"));
        product.setStock(document.getInteger("stock"));
        product.setCategory(document.getString("category"));
        product.setDiscountPercentage(document.getDouble("discountPercentage"));
        
        return product;
    }

    public List<Product> getAllProductsFromMongo() {
        List<Product> products = new ArrayList<>();
        for (Document document : collection.find()) {
            Product product = new Product();
            product.setId(document.getInteger("id"));
            product.setTitle(document.getString("title"));
            product.setDescription(document.getString("description"));
            product.setPrice(document.getInteger("price"));
            product.setBrand(document.getString("brand"));
            product.setStock(document.getInteger("stock"));
            product.setCategory(document.getString("category"));
            product.setDiscountPercentage(document.getDouble("discountPercentage"));
      
            products.add(product);
        }

        return products;
    }

    private void createConnection() {
        String server = "localhost";
        Integer port = 27017;
        try {
            System.out.println("holi");
            MongoClient mongoClient = MongoClients.create(
                    MongoClientSettings.builder()
                            .applyToClusterSettings(builder
                                    -> builder.hosts(Arrays.asList(new ServerAddress(server, port))))
                            .build());
            System.out.println("holi2");
            this.setDataBase(mongoClient.getDatabase("ProgrammingTechniques"));
            collection = dataBase.getCollection("ProductClass");
            System.out.println("holi3");
        } catch (Exception exe) {
            System.out.println("Connection Error.");
        }
    }
}
