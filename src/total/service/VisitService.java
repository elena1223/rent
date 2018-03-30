package total.service;

import java.util.*;

import javax.management.Query;

import org.bson.BsonDocument;
import org.bson.BsonValue;
import org.bson.Document;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.stereotype.Service;

import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.result.DeleteResult;

import total.controller.VisitController;


@Service
public class VisitService {

	public List listVisit() {
		
		MongoClient client = new MongoClient("13.125.168.55", 27017);
		MongoDatabase db = client.getDatabase("board");
		MongoCollection collection = db.getCollection("visit");
		
		List<Map> list = new ArrayList<>();
		
		try {
			
			Query query = new Query();
			FindIterable<Document> finds = collection.find(new Document());
//			System.out.println("finds : " + finds);
	
			if(finds != null) {
			
				for(Document doc : finds) {
					Map visit = new HashMap<>(); 
					
					visit.put("name", doc.get("name"));
					visit.put("comment", doc.get("comment"));
					visit.put("tags", doc.get("tags"));
					visit.put("date", doc.get("date"));
					visit.put("id", doc.get("_id"));

					list.add(visit);
				}
				
//				System.out.println("리스트 : " + list);
				
				client.close();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	
	public boolean writeVisit(Map data) {
		
		MongoClient client = new MongoClient("13.125.168.55", 27017);
		MongoDatabase db = client.getDatabase("board");
		MongoCollection collection = db.getCollection("visit");
		
		Document doc2 = new Document(data);
//		System.out.println("제이슨으로 바꾼 문장  :" + doc2.toJson());
		boolean rst=false;
		try {
			collection.insertMany(Arrays.asList(doc2));		
			rst = true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		client.close();	
		return rst;
		
	}
	
	public boolean delVisit(String id) {
		
		MongoClient client = new MongoClient("13.125.168.55", 27017);
		MongoDatabase db = client.getDatabase("board");
		MongoCollection collection = db.getCollection("visit");
		
		List<Map> list = new ArrayList<>();
		boolean rst = false;
			Document bd = new Document("_id", new ObjectId(id));
//			System.out.println("서비스oid : " + new ObjectId(id));
		try {
			
			DeleteResult dr = collection.deleteMany(bd);
			System.out.println("dr.getDeletedCount() : "  + dr.getDeletedCount());
			if (dr.getDeletedCount()==1) {
				rst= true;
			}
				client.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}					
					
		return rst;
		
	}
		
	
	

}
