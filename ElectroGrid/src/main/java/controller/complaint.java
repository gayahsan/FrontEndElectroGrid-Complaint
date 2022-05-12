package controller;

import java.util.ArrayList;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

import com.google.gson.*;

import org.json.JSONException;
import org.json.simple.*;

import model.*;

import org.apache.tomcat.util.json.JSONParser;
import org.jsoup.*;
import org.jsoup.parser.*;
import org.jsoup.nodes.Document;

@Path("/complaint")
public class complaint {

	complaintModel com =new complaintModel();
	
	@GET
	@Produces(MediaType.TEXT_HTML)
	public String view(String app_text)
	{
		return com.getComplaint();
	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public String add(String app_text)
	{
		//Convert the input string to a JSON object
		JsonObject app = new JsonParser().parse(app_text).getAsJsonObject();

		if(app.get("name").getAsString()!=""&&app.get("account_number").getAsString()!=""&&app.get("phone").getAsString()!=""&&app.get("email").getAsString()!=""&&app.get("complaintType").getAsString()!=""&&app.get("massage").getAsString()!="") {

			com.addComplaint(app.get("account_number").getAsString(),app.get("name").getAsString(),app.get("phone").getAsString(),app.get("email").getAsString(),app.get("complaintType").getAsString(),app.get("subject").getAsString(),app.get("massage").getAsString());
			
			JSONObject json = new JSONObject();
			json.put("success", Integer.toString(com.getSuccess()));
			
			return json.toString();
			
		}else {
			
			JSONObject json = new JSONObject();
			json.put("success", 0);
			
			return json.toString();
		}			
	}
	
	@PUT
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public String edit(String app_text)
	{
		//Convert the input string to a JSON object
		JsonObject app = new JsonParser().parse(app_text).getAsJsonObject();

		if(app.get("id").getAsString()!=""&&app.get("name").getAsString()!=""&&app.get("account_number").getAsString()!=""&&app.get("phone").getAsString()!=""&&app.get("email").getAsString()!=""&&app.get("complaintType").getAsString()!=""&&app.get("massage").getAsString()!="") {

			com.editComplaint(Integer.parseInt(app.get("id").getAsString()),app.get("account_number").getAsString(),app.get("name").getAsString(),app.get("phone").getAsString(),app.get("email").getAsString(),app.get("complaintType").getAsString(),app.get("subject").getAsString(),app.get("massage").getAsString());
			
			JSONObject json = new JSONObject();
			json.put("success", Integer.toString(com.getSuccess()));
	
			return json.toString();
			
		}else {
			
			JSONObject json = new JSONObject();
			json.put("success", 0);
			
			return json.toString();
		}	
	}
	
	@SuppressWarnings("unchecked")
	@DELETE
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public String delete(String app_text)
	{
		//Convert the input string to a JSON object
		JsonObject app = new JsonParser().parse(app_text).getAsJsonObject();
		if(app.get("id").getAsString()!="") {
	
			com.deleteComplaint(Integer.parseInt(app.get("id").getAsString()));
			
			JSONObject json = new JSONObject();
			json.put("success", Integer.toString(com.getSuccess()));
	
			return json.toString();
			
		}else {
			
			JSONObject json = new JSONObject();
			json.put("success", 0);
			
			return json.toString();	
		}	
	}
	
	@POST
	@Path("/get")
	@Produces(MediaType.TEXT_HTML)
	public String viewOne(String app_text) throws RuntimeException, JSONException 
	{
		JsonObject app = new JsonParser().parse(app_text).getAsJsonObject();
		
		return com.getOneComplaint(Integer.parseInt(app.get("id").getAsString())).toString();
	}
}
