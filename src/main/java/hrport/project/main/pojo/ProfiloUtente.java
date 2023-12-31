package hrport.project.main.pojo;

import java.time.LocalDate;
import java.util.Set;

public class ProfiloUtente {

	private Integer idUtente;
	private Integer idCv;
	private String fileUrl;
	private String nome;
	private String cognome;
	private String fotoUrl;
	private Boolean gender;
	private LocalDate dNascita;
	private String indResidenza;
	private String inDomicilio;
	private String telefono;
	private String codiceFiscale;
	private String statoOrigine;
	private String comNascita;
	private Set<EspLavorativa> experiences;
	private Set<Istruzione> education;
	private Set<CategoriaSkills> category;
	
	public ProfiloUtente(Integer idUtente, Integer idCv, String fileUrl, String fotoUrl, Boolean gender,
			LocalDate dNascita, String indResidenza, String inDomicilio, String telefono, String codiceFiscale,
			String statoOrigine, String comNascita) {

		setIdUtente(idUtente);
		setIdCv(idCv);
		setFileUrl(fileUrl);
		setFotoUrl(fotoUrl);
		setGender(gender);
		setdNascita(dNascita);
		setIndResidenza(indResidenza);
		setInDomicilio(inDomicilio);
		setTelefono(telefono);
		setCodiceFiscale(codiceFiscale);
		setStatoOrigine(statoOrigine);
		setComNascita(comNascita);
	}

	public ProfiloUtente(Integer idUtente, Integer idCv, String fileUrl, String fotoUrl, Boolean gender,
			LocalDate dNascita, String indResidenza, String inDomicilio, String telefono, String codiceFiscale,
			String statoOrigine, String comNascita, Set<EspLavorativa> experiences, Set<Istruzione> education, Set<CategoriaSkills> category) {

		setIdUtente(idUtente);
		setIdCv(idCv);
		setFileUrl(fileUrl);
		setFotoUrl(fotoUrl);
		setGender(gender);
		setdNascita(dNascita);
		setIndResidenza(indResidenza);
		setInDomicilio(inDomicilio);
		setTelefono(telefono);
		setCodiceFiscale(codiceFiscale);
		setStatoOrigine(statoOrigine);
		setComNascita(comNascita);
		setExperiences(experiences);
		setEducation(education);
		setCategory(category);
	}

	public ProfiloUtente(Integer idUtente, String nome, String cognome, String fileUrl, String fotoUrl,
			Boolean gender, LocalDate dNascita, String indResidenza, String inDomicilio, String telefono,
			String codiceFiscale, String statoOrigine, String comNascita, Set<EspLavorativa> experiences,
			Set<Istruzione> education) {

		setIdUtente(idUtente);
		setNome(nome);
		setCognome(cognome);
		setFileUrl(fileUrl);
		setFotoUrl(fotoUrl);
		setGender(gender);
		setdNascita(dNascita);
		setIndResidenza(indResidenza);
		setInDomicilio(inDomicilio);
		setTelefono(telefono);
		setCodiceFiscale(codiceFiscale);
		setStatoOrigine(statoOrigine);
		setComNascita(comNascita);
		setExperiences(experiences);
		setEducation(education);

	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public Integer getIdUtente() {
		return idUtente;
	}

	public void setIdUtente(Integer idUtente) {
		this.idUtente = idUtente;
	}

	public Integer getIdCv() {
		return idCv;
	}

	public void setIdCv(Integer idCv) {
		this.idCv = idCv;
	}

	public String getFileUrl() {
		return fileUrl;
	}

	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}

	public String getFotoUrl() {
		return fotoUrl;
	}

	public void setFotoUrl(String fotoUrl) {
		this.fotoUrl = fotoUrl;
	}

	public Boolean isGender() {
		return gender;
	}

	public void setGender(Boolean gender) {
		this.gender = gender;
	}

	public LocalDate getdNascita() {
		return dNascita;
	}

	public void setdNascita(LocalDate dNascita) {
		this.dNascita = dNascita;
	}

	public String getIndResidenza() {
		return indResidenza;
	}

	public void setIndResidenza(String indResidenza) {
		this.indResidenza = indResidenza;
	}

	public String getInDomicilio() {
		return inDomicilio;
	}

	public void setInDomicilio(String inDomicilio) {
		this.inDomicilio = inDomicilio;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getCodiceFiscale() {
		return codiceFiscale;
	}

	public void setCodiceFiscale(String codiceFiscale) {
		this.codiceFiscale = codiceFiscale;
	}

	public String getStatoOrigine() {
		return statoOrigine;
	}

	public void setStatoOrigine(String statoOrigine) {
		this.statoOrigine = statoOrigine;
	}

	public String getComNascita() {
		return comNascita;
	}

	public void setComNascita(String comNascita) {
		this.comNascita = comNascita;
	}

	public Set<EspLavorativa> getExperiences() {
		return experiences;
	}

	public void setExperiences(Set<EspLavorativa> experiences) {
		this.experiences = experiences;
	}

	public Set<Istruzione> getEducation() {
		return education;
	}

	public void setEducation(Set<Istruzione> education) {
		this.education = education;
	}

	public Set<CategoriaSkills> getCategory() {
		return category;
	}

	public void setCategory(Set<CategoriaSkills> category) {
		this.category = category;
	}
	
	public void vilidateProfileInfo() throws Exception {
		
		// telefono
		String telefono = getTelefono();
		if(telefono.length() > 10) throw new Exception("il campo telefono deve essere inferiore a 10 caratteri");
		try {
			
			Integer.valueOf(telefono);
		} catch (NumberFormatException e) {
			// TODO: handle exception
			throw new Exception("il campo telefono deve essere composto da soli numeri");
		}
		
		//codice fiscale
		String codiceFiscale = getCodiceFiscale();
		if(codiceFiscale.length() != 16) throw new Exception("il campo codice fiscale deve essere di 16 caratteri");
	}
}
