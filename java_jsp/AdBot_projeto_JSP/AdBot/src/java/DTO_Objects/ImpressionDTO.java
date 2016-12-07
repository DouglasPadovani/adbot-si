/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO_Objects;


public class ImpressionDTO {
    
    private int campaign_id;
    private String link_figura_da_impression;
    
    public ImpressionDTO(){}
    
    //Getters

    public int getCampaign_id() {
        return campaign_id;
    }

    public String getLink_figura_da_impression() {
        return link_figura_da_impression;
    }
    
    //Setters

    public void setCampaign_id(int campaign_id) {
        this.campaign_id = campaign_id;
    }

    public void setLink_figura_da_impression(String link_figura_da_impression) {
        this.link_figura_da_impression = link_figura_da_impression;
    }
    
    
}
