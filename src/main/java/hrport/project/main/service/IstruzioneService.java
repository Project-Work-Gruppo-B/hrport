package hrport.project.main.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Set;
import java.util.TreeSet;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import hrport.project.main.adaptergson.LocalDateAdapter;
import hrport.project.main.connectdb.ConnectDatabase;
import hrport.project.main.pojo.Istruzione;

public class IstruzioneService {

	public static Set<Istruzione> getEducationByIdUtente(String idUtente) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		
		ResultSet resultSetIstr = null;
		Set<Istruzione> education = new TreeSet<>(new Comparator<Istruzione>() {

			@Override
			public int compare(Istruzione o1, Istruzione o2) {
				// TODO Auto-generated method stub
				return o1.getIdIst().compareTo(o2.getIdIst());
			}
		});
		
		try {
			
			con.setAutoCommit(false);
			String SQLUserPositions = "SELECT istr.* FROM Profilo pr INNER JOIN Istruzione istr ON pr.idCv = istr.idCv WHERE pr.idUtente = ?";
			
			PreparedStatement userEducation = con.prepareStatement(SQLUserPositions);
			userEducation.setString(1, idUtente);
			
			resultSetIstr = userEducation.executeQuery();
			
			while(resultSetIstr.next()) {
				
				education.add(new Istruzione(Integer.valueOf(resultSetIstr.getString("idIst")), Integer.valueOf(resultSetIstr.getString("idCv")), resultSetIstr.getString("titoloIstruzione"), resultSetIstr.getString("istituto"), resultSetIstr.getString("indirizzo"), Integer.valueOf(resultSetIstr.getString("voto")), LocalDate.parse(resultSetIstr.getString("dInizio")), LocalDate.parse(resultSetIstr.getString("dFine"))));
			}
			
			con.commit();
		} catch (Exception e) {
			
			con.rollback();
			education = new HashSet<>();
		} finally {
			
			resultSetIstr.close();
			con.close();
		}
		
		return education;
	}
	
	public static void insertIstruzInfo(String json, Integer idCv) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		Gson gson = new GsonBuilder().registerTypeAdapter(LocalDate.class, new LocalDateAdapter()).create();
		Istruzione education = null;

		try {
			
			con.setAutoCommit(false);
			
			education = gson.fromJson(json, Istruzione.class);
					
			String SQL = "INSERT INTO \"Istruzione\" (\"idCv\", \"titoloIstruzione\", \"istituto\", \"indirizzo\", \"voto\", \"dInizio\", \"dFine\")\r\n"
					+ "VALUES (?, ?, ?, ?, ?, ?, ?);";
			
			PreparedStatement insertIstruz = con.prepareStatement(SQL);
			
			insertIstruz.setInt(1, idCv);
			insertIstruz.setString(2, education.getTitoloIstruzione());
			insertIstruz.setString(3, education.getIstituto());
			insertIstruz.setString(4, education.getIndirizzo());
			insertIstruz.setInt(5, education.getVoto());
			insertIstruz.setDate(6, Date.valueOf(education.getdInizio()));
			insertIstruz.setDate(7, Date.valueOf(education.getdFine()));
			
			insertIstruz.executeUpdate();
			
			con.commit();
		} catch (Exception e) {
			
			con.rollback();
			throw e;
		} finally {
			
			con.close();
		}
			
	}
	
	public static void updateIstruzInfo(String json, Integer idCv) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		Gson gson = new GsonBuilder().registerTypeAdapter(LocalDate.class, new LocalDateAdapter()).create();
		Istruzione education = null;
			
		try {
			
			con.setAutoCommit(false);
			
			education = gson.fromJson(json, Istruzione.class);
					
			String SQL = "UPDATE \"Istruzione\""
					+ "SET titoloIstruzione = ?,"
					+ "istituto = ?,"
					+ "indirizzo = ?,"
					+ "voto = ?,"
					+ "dInizio = ?,"
					+ "dFine = ?"
					+ "WHERE Istruzione.idIst = ?"
					+ "AND Istruzione.idCv = ?";
			
			PreparedStatement updateIstruz = con.prepareStatement(SQL);
			
			updateIstruz.setString(1, education.getTitoloIstruzione());
			updateIstruz.setString(2, education.getIstituto());
			updateIstruz.setString(3, education.getIndirizzo());
			updateIstruz.setInt(4, education.getVoto());
			updateIstruz.setDate(5, Date.valueOf(education.getdInizio()));
			updateIstruz.setDate(6, Date.valueOf(education.getdFine()));
			updateIstruz.setInt(7, education.getIdIst());
			updateIstruz.setInt(8, idCv);
			
			updateIstruz.executeUpdate();
			
			con.commit();
		} catch (Exception e) {
			
			con.rollback();
			throw e;
		} finally {
			
			con.close();
		}
			
	}
	
	public static void deleteIstruzInfo(Integer idTable, Integer idCv) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
			
		try {
			
			con.setAutoCommit(false);
					
			String SQL = "DELETE FROM Istruzione WHERE Istruzione.idIst = ? AND Istruzione.idCv = ?;";
			
			PreparedStatement deleteIstruz = con.prepareStatement(SQL);
			
			deleteIstruz.setInt(1, idTable);
			deleteIstruz.setInt(2, idCv);
			
			deleteIstruz.executeUpdate();
			
			con.commit();
		} catch (Exception e) {
			
			con.rollback();
			throw e;
		} finally {
			
			con.close();
		}
			
	}
}
