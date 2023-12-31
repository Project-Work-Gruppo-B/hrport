<%@ page contentType="text/html;charset=UTF-8" session="false" %>
	<!DOCTYPE html>
	<html lang="en">

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>TalentBridge</title>
		<link href="/hrport/resources/css/custom/custom.css" rel="stylesheet">
		<link
			href="https://cdn.datatables.net/v/bs5/jq-3.7.0/dt-1.13.7/b-2.4.2/b-html5-2.4.2/r-2.5.0/datatables.min.css"
			rel="stylesheet">
		<script type="text/javascript" src="/hrport/resources/js/bootstrap.bundle.min.js"></script>

	</head>

	<body class="bg-body-tertiary">

		<jsp:include page='../view-common/account_edit_modal.jsp'></jsp:include>

		<jsp:include page='../view-common/admin_header.jsp'>
			<jsp:param name="activeLinkId" value="posizioni" />
		</jsp:include>

		<section style="min-height: 100vh;">
			<div class="container-fluid p-4">
				<h1>Posizione</h1>
				<hr>

				<div class="modal fade" id="gestisci_candidato_modal" tabindex="-1" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content border border-2 border-primary">
							<div class="modal-header bg-body-tertiary">
								<h1 class="modal-title fs-5">Gestisci Candidatura</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<p>
									Chiudi questa candidatura e impostala come:
								</p>
								<div class="row">
									<div class="col-9">
										<select class="form-select" id="select_esegui_azione_candidato" aria-label="Default select example">
											<option selected disabled>Scegliere azione</option>
											<option value="2">Accettata</option>
											<option value="3">Rifiutata</option>
											<!-- <option value="4">Chiusa (Rifiuta senza motivo)</option> -->
										</select>
									</div>
									<div class="col-3">
										<button type="button" id="btn_esegui_azione_candidato"
											class="btn btn-primary text-light w-100">
											<h5 class="m-0">Esegui</h5>
										</button>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" data-bs-dismiss="modal" class="btn btn-primary text-light">
									<h5 class="m-0">Chiudi</h5>
								</button>
							</div>
						</div>
					</div>
				</div>

				<div class="row mb-3">
					<div class="col-5">
						<h2 class="mb-3">Dati posizione</h2>
						<div class="card" style="width: 100%;">
							<div class="rounded shadow-sm mb-1 bg-dark"
								style="width: 100%; height: 220px; background-position: center center; background-size: cover; background-repeat: no-repeat; aspect-ratio: 5/4;"
								id="position_propic">
							</div>
							<div id="updateForm" class="card-body">
								<div class="row mb-3">
									<label for="input_id_posizione" class="col-sm-3 col-form-label">ID
										Posizione</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="input_id_posizione"
											value="<%=request.getAttribute(" idPosizione")%>" readonly
										disabled>
									</div>
								</div>
								<div class="row mb-3">
									<label for="input_nome_posizione" class="col-sm-3 col-form-label">Nome</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="input_nome_posizione">
									</div>
								</div>
								<fieldset class="row mb-3">
									<legend class="col-form-label col-sm-3 pt-0">Stato</legend>
									<div class="col-sm-9">
										<div class="form-check">
											<input class="form-check-input" type="radio" name="input_stato"
												id="input_stato_aperta" value="aperta">
											<label class="form-check-label" for="input_stato_aperta">
												Aperta </label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="radio" name="input_stato"
												id="input_stato_chiusa" value="chiusa">
											<label class="form-check-label" for="input_stato_chiusa">
												Chiusa </label>
										</div>
									</div>
								</fieldset>
								<hr>
								<div class="row mb-3">
									<label for="input_id_foto_url" class="col-sm-3 col-form-label">URL
										Immagine</label>
									<div class="col-sm-9">
										<input type="file" accept=".png,.jpg,.jpeg" class="form-control"
											id="input_id_foto_url">
									</div>
								</div>
								<div class="row mb-3 d-flex justify-content-end p-2"></div>
								<div class="row mb-3">
									<label for="input_descrizione" class="col-sm-3 col-form-label">Descrizione</label>
									<div class="col-sm-9">
										<textarea class="form-control" id="input_descrizione"
											style="height: 400px;"></textarea>
									</div>
								</div>
								<hr class="mb-4">
								<div class="d-flex flex-row justify-content-between align-items-center p-2 mb-4">
									<!-- <a href="#" class="m-0 link-danger">Elimina posizione</a> -->
									<a id="eliminaPositionBtn" style="cursor: pointer;" class="m-0 link-danger" onclick="deletePosizione()">
										<h5 class="m-0">Elimina posizione</h5>
									</a>
									<button id="updatePositionBtn" class="btn btn-primary text-light"
										onclick="updatePosizione()">
										<h5 class="m-0">Salva</h5>
									</button>
								</div>
							</div>
						</div>
					</div>
					<div class="col-7">
						<h2 class="mb-3">Candidati Posizione</h2>
						<div class="card bg-white">
							<div class="card-body">
								<table id="myTable" class="table table-striped">
									<thead>
										<tr>
											<th>ID</th>
											<th>Nome</th>
											<th>Cognome</th>
											<th>Punteggio</th>
											<th>Stato candidatura</th>
											<th>Profilo</th>
										</tr>
									</thead>
									<tbody id="profiles-data">
										<!-- Lista di profili -->
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

			</div>
		</section>
		<jsp:include page='../view-common/footer.jsp'></jsp:include>
		<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
		<script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
		<script src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
		<script src="https://cdn.datatables.net/buttons/2.4.2/js/dataTables.buttons.min.js"></script>
		<script src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.bootstrap5.min.js"></script>
		<script src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.html5.min.js"></script>
		<script src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.print.min.js"></script>
		<script src="https://cdn.datatables.net/responsive/2.5.0/js/dataTables.responsive.min.js"></script>
		<script src="https://cdn.datatables.net/responsive/2.5.0/js/responsive.bootstrap5.js"></script>
		<script
			src="https://cdn.datatables.net/v/bs5/jq-3.7.0/dt-1.13.7/b-2.4.2/b-html5-2.4.2/r-2.5.0/datatables.min.js"></script>
		<script>

			//Object from database
			let JSPposizione = `<%=request.getAttribute("dataPos")%>`;
			let JSPcandidati = `<%=request.getAttribute("candidati")%>`;


			//Object Json
			let JsonPosizione = JSON.parse(JSPposizione);
			let JsonCandidati = JSON.parse(JSPcandidati);


			console.log(JsonPosizione);

			//Generate position data detail
			let inputNamePosition = document.querySelector("#input_nome_posizione");
			let inputIdPosition = document.querySelector("#input_id_posizione");
			let radioAperta = document.querySelector("#input_stato_aperta");
			let radioChiusa = document.querySelector("#input_stato_chiusa");
			let descrizione = document.querySelector("#input_descrizione");

			inputIdPosition.value = JsonPosizione.idPos;
			inputNamePosition.value = JsonPosizione.nome;
			radioAperta.checked = JsonPosizione.aperta;
			radioChiusa.checked = !JsonPosizione.aperta;
			descrizione.value = JsonPosizione.descrizione;


			function getStatus(int){
				switch(int){
					case 0:
						return "Incompleta"
					case 1:
						return "Completa"
					case 2:
						return "Accettata"
					case 3:
						return "Rifiutata"
					case 4:
						return "Chiusa"
				}
				return "...";
			}



			//Generate table candidati list
			let tableBody = document.querySelector("#profiles-data");

			let editIconSvg = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 16 16"><path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001"/></svg>'
			let viewIconSvg = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16"><path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/></svg>'

			JsonCandidati.forEach(function (candidato) {

				if (candidato.position.idPos === JsonPosizione.idPos) {

					let row = document.createElement("tr");

					let idCell = document.createElement("td");
					idCell.textContent = candidato.idCand;

					let nomeCell = document.createElement("td");
					nomeCell.textContent = candidato.user.nome;

					let cognomeCell = document.createElement("td");
					cognomeCell.textContent = candidato.user.cognome;

					let posizioneCell = document.createElement("td");
					posizioneCell.textContent = candidato.punteggioTot;

					let statoCell = document.createElement("td");
					statoElement = document.createElement('a');
					statoElement.classList.add('icon-link');
					statoElement.innerHTML = getStatus(candidato.stato) + editIconSvg;
					statoElement.href = "#";
					statoElement.setAttribute('data-bs-toggle', 'modal');
					statoElement.setAttribute('data-bs-target', '#gestisci_candidato_modal')
					statoElement.setAttribute('data-id-cadidato', candidato.idCand);



					let linkCell = document.createElement("td");
					let linkElement = document.createElement("a");
					linkElement.classList.add('icon-link');
					linkElement.innerHTML = "Profilo" + viewIconSvg;
					linkElement.target = "_blank";
					linkElement.href = "http://localhost:8080/hrport/admin/profilo/" + candidato.user.idUtente;

					// let manageCell = document.createElement("td");
					// let manageElement = document.createElement('a');
					// manageElement.textContent = "Gestisci";
					// manageElement.href = "#";
					// manageElement.setAttribute('data-bs-toggle', 'modal');
					// manageElement.setAttribute('data-bs-target', '#gestisci_candidato_modal')
					// manageElement.setAttribute('data-id-cadidato', candidato.idCand);

					linkCell.appendChild(linkElement);
					statoCell.appendChild(statoElement);

					row.appendChild(idCell);
					row.appendChild(nomeCell);
					row.appendChild(cognomeCell);
					row.appendChild(posizioneCell);
					row.appendChild(statoCell);
					row.appendChild(linkCell);
					// row.appendChild(manageCell);

					tableBody.appendChild(row);

				}

			});
			let fotoUrl = "http://localhost:8080/hrport/app/getAttachment/immagini_posizioni?imgPath=" + JsonPosizione.fotoUrl;

			let anagraficaWidgetProPic = document.querySelector('#position_propic');

			anagraficaWidgetProPic.style.backgroundImage = "url('" + fotoUrl + "')";

			//console.log(JsonPosizione);

			document.querySelector('#gestisci_candidato_modal').addEventListener('show.bs.modal', e => {
				let btn = e.relatedTarget;
				document.querySelector('#gestisci_candidato_modal').setAttribute('data-candidatura-id', btn.getAttribute('data-id-cadidato'));
			});

			document.querySelector('#btn_esegui_azione_candidato').addEventListener('click', e => {
				let status = parseInt(document.querySelector('#select_esegui_azione_candidato').value);
				
				if(isNaN(status) || status == undefined || status == null){
					return;
				}

				let data = {
					idCand: parseInt(document.querySelector('#gestisci_candidato_modal').getAttribute('data-candidatura-id')),
					stato: status
				}
				updateApplicationStatus(data, function (error, data) {
					if (error != null) {
						console.log(error);
						return;
					}
					setTimeout(function(){ location.reload() }, 500);
				});
			});

			async function updateApplicationStatus(data, callback) {

				const response = await fetch('http://localhost:8080/hrport/admin/change-status-application', {
					method: 'POST',
					headers: {
						'Content-Type': 'application/json'
					},
					body: JSON.stringify(data)
				});

				const result = await response.json();

				// console.log(result);

				if (result.error != null) {
					callback(result.error, null);
				}

				if (response.ok) {
					callback(null, result);
				}
			}

			async function updatePosizione() {

				let form = document.querySelector('#updateForm');
				let idPosizione = form.querySelector('#input_id_posizione').value;
				let nomePosizione = form.querySelector('#input_nome_posizione').value;
				let stato = form.querySelector('input[name="input_stato"]:checked').value === "aperta" ? true : false;
				let idFotoUrl = form.querySelector('#input_id_foto_url');
				let descrizione = form.querySelector('#input_descrizione').value;


				let positionData = {
					idPos: JsonPosizione.idPos,
					nome: nomePosizione === "" ? JsonPosizione.nome : nomePosizione,
					aperta: stato === "" ? JsonPosizione.aperta : stato,
					descrizione: descrizione === "" ? JsonPosizione.descrizione : descrizione

				}

				const file = idFotoUrl.files[0];
				console.log("entro")

				const formData = new FormData();
				formData.append('idPos', positionData.idPos);
				formData.append('nome', positionData.nome);
				formData.append('aperta', positionData.aperta);
				formData.append('descrizione', positionData.descrizione);
				if (file) {

					formData.append('file', file);
				}

				//Update posizione
				await fetch('http://localhost:8080/hrport/admin/update-posizione', {
					method: 'POST',
					body: formData
				}).then((response) => {

					const result = response.text();
					console.log(result);

					if (response.ok) {

						console.log("success")
						window.location.href = "http://localhost:8080/hrport/admin/posizioni"
					}
				});
			}

			//Delete posizione
			function deletePosizione() {
				fetch('http://localhost:8080/hrport/admin/delete-posizione/' + JsonPosizione.idPos, {
					method: 'DELETE',
					headers: {
						'Content-Type': 'application/json',
					},
				})
					.then(response => response.json())
					.then(data => {
						console.log(data);
					})
					.catch(error => {
						console.error('Error:', error);
					});

				setTimeout(function () {
					window.location.href = "http://localhost:8080/hrport/admin/posizioni";
				}, 500);
			}

			let table = new DataTable('#myTable', {
				dom: "PlftipB",
				buttons: [
					{
						extend: 'pdf',
						text: 'Save current page',
						exportOptions: {
							modifier: {
								page: 'current'
							}
						}
					}
				],
				"oLanguage": {
					"sLengthMenu": "Mostra _MENU_ risultati per pagina",
					"sZeroRecords": "Nessun candidato trovato per questa posizione",
					"sInfo": "Mostrando i record da _START_ a _END_. Totale: _TOTAL_",
					"sInfoEmpty": "Nessun record da mostrare",
					"sInfoFiltered": "(filtrati tra _MAX_ record)"
				}
			});
		</script>
	</body>

	</html>