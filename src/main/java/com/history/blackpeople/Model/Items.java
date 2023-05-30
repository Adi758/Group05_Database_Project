package com.history.blackpeople.Model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Items {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long itemID;
    private String itemName;
    private String itemCaption;
    private String filePath;

    public Long getItemID() {
        return itemID;
    }
    public void setItemID(Long itemID) {
        this.itemID = itemID;
    }
    public String getItemName() {
        return itemName;
    }
    public void setItemName(String itemName) {
        this.itemName = itemName;
    }
    public String getItemCaption() {
        return itemCaption;
    }
    public void setItemCaption(String itemCaption) {
        this.itemCaption = itemCaption;
    }
    public String getFilePath() {
        return filePath;
    }
    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }
    @Override
    public String toString() {
        return "Items [itemID=" + itemID + ", itemName=" + itemName + ", itemCaption=" + itemCaption + ", filePath="
                + filePath + "]";
    }

}
