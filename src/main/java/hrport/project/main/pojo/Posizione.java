package hrport.project.main.pojo;

public class Posizione {
	
	private Integer idPos;
	private String nome;
	private Boolean aperta;
	private String fotoUrl;
	
	public Posizione(Integer idPos, String nome, Boolean aperta, String fotoUrl){
		
		setIdPos(idPos);
		setNome(nome);
		setAperta(aperta);
		setFotoUrl(fotoUrl);
	}

	public Integer getIdPos() {
		return idPos;
	}

	public void setIdPos(Integer idPos) {
		this.idPos = idPos;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Boolean getAperta() {
		return aperta;
	}

	public void setAperta(Boolean aperta) {
		this.aperta = aperta;
	}

	public String getFotoUrl() {
		return fotoUrl;
	}

	public void setFotoUrl(String fotoUrl) {
		this.fotoUrl = fotoUrl;
	}
}