/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.resumesmongodbclass.infrastructure;

import com.mongodb.BasicDBObject;
import com.mongodb.MongoClientSettings;
import com.mongodb.ServerAddress;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import static com.mongodb.client.model.Filters.eq;
import com.mycompany.resumesmongodbclass.models.CV;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.bson.Document;

/**
 *
 * @author Usuario
 */
public class ResumesMongoDB {

    private MongoDatabase dataBase;
    private MongoCollection<Document> collection;

    public ResumesMongoDB() {
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
    
    public boolean updateCv(CV cv){
        BasicDBObject basicDocument = new BasicDBObject();
        
        basicDocument.append("name", cv.getName());
        basicDocument.append("email", cv.getEmail());
        basicDocument.append("phone", cv.getPhone());
        basicDocument.append("address", cv.getAddress());
        basicDocument.append("photo", cv.getPhoto());
        
        BasicDBObject documentToUpdate = new BasicDBObject();
        documentToUpdate.append("id", cv.getId());
        
        collection.updateOne(documentToUpdate, 
                new BasicDBObject().append("$set", basicDocument));
        
        return true;
    }   
    
    public boolean createCv(CV cv){
        Document document = new Document();
        
        document.append("id", cv.getId());
        document.append("name", cv.getName());
        document.append("email", cv.getEmail());
        document.append("phone", cv.getPhone());
        document.append("address", cv.getAddress());
        document.append("photo", cv.getPhoto());
        
        collection.insertOne(document);
        
        return true;
    }   
    
    public boolean deleteCvById(String id) throws Exception{
        Document document = this.collection.find(eq("id", id)).first();
        
        if(document == null){
            throw new Exception();
        }
        
        BasicDBObject basicDocument = new BasicDBObject();
        basicDocument.append("id", id);
        
        collection.deleteOne(basicDocument);
        
        return true;
    }
    

    public CV getCvById(String id) {
        Document document = this.collection.find(eq("id", id)).first();
        
        CV cv = new CV();
        cv.setId(document.getString("id"));
        cv.setName(document.getString("name"));
        cv.setEmail(document.getString("email"));
        cv.setPhone(document.getString("phone"));
        cv.setAddress(document.getString("address"));
        cv.setPhoto(document.getString("photo"));
        
        return cv;
    }

    public List<CV> getAllCvsFromMongo() {
        List<CV> cvs = new ArrayList<>();
        for (Document document : collection.find()) {
            CV cv = new CV();
            cv.setId(document.getString("id"));
            cv.setName(document.getString("name"));
            cv.setEmail(document.getString("email"));
            cv.setPhone(document.getString("phone"));
            cv.setAddress(document.getString("address"));
            cv.setPhoto(document.getString("photo"));
            cv.setAddress(document.getString("address"));
            cvs.add(cv);
        }

        return cvs;
    }

    private void createConnection() {
        String server = "localhost";
        Integer port = 27017;
        try {
            MongoClient mongoClient = MongoClients.create(
                    MongoClientSettings.builder()
                            .applyToClusterSettings(builder
                                    -> builder.hosts(Arrays.asList(new ServerAddress(server, port))))
                            .build());
            this.setDataBase(mongoClient.getDatabase("ProgrammingTechniques"));
            collection = dataBase.getCollection("resumes");
        } catch (Exception exe) {
            System.out.println("Connection Error.");
        }
    }
}
