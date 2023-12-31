<%@ page contentType="text/html;charset=UTF-8" session="false" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profilo candidato | TalentBridge</title>
        <link href="<%=request.getContextPath()%>/resources/css/custom/custom.css" rel="stylesheet">
        <script type="text/javascript"
            src="<%=request.getContextPath()%>/resources/js/bootstrap.bundle.min.js"></script>
    </head>

    <body class="bg-body-tertiary">

        <jsp:include page='../view-common/account_edit_modal.jsp'></jsp:include>


        <jsp:include page='../view-common/admin_header.jsp'>
            <jsp:param name="activeLinkId" value="candidati" />
        </jsp:include>

        <section style="min-height: 100vh;">
            <div class="container-fluid p-4">
                <h1 class="mb-2">Profilo candidato</h1>
                <hr>

                <div class="row">

                    <div class="row mb-3">

                        <div class="col-5">
                            <h2 class="mb-3">Anagrafica</h2>
                            <div class="card mb-3" style="width: 100%;">
                                <div class="card-body">

                                    <div class="alert alert-info d-none" id="anagrafica_info_text" role="alert">

                                    </div>

                                    <div class="mb-5">
                                        <div class="d-flex justify-content-center align-items-center flex-column">
                                            <div class="rounded shadow-sm mb-1 bg-dark"
                                                style="width: 150px; height: 150px; background-position: center center; background-size: cover; background-repeat: no-repeat;"
                                                id="anagrafica_propic">
                                            </div>
                                            <p class="fs-3" id="anagrafica_full_name"></p>
                                        </div>
                                    </div>

                                    <form id="anagrafica_form">

                                        <div class="row">
                                            <div class="col-6">
                                                <div class="mb-3">
                                                    <label for="anagrafica_data_nascita" class="form-label">Data di
                                                        nascita</label>
                                                    <input type="date" class="form-control" id="anagrafica_data_nascita"
                                                        readonly>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="mb-3">
                                                    <label for="anagrafica_provincia_nascita"
                                                        class="form-label">Provincia
                                                        di nascita</label>
                                                    <input type="text" class="form-control"
                                                        id="anagrafica_provincia_nascita" list="lista_province"
                                                        readonly>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-6">
                                                <div class="mb-3">
                                                    <label for="anagrafica_numero_telefono" class="form-label">Numero di
                                                        telefono</label>
                                                    <input type="tel" class="form-control"
                                                        id="anagrafica_numero_telefono" readonly>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="mb-3">
                                                    <label for="anagrafica_stato_origine" class="form-label">Stato di
                                                        origine</label>
                                                    <input type="tel" class="form-control" list="lista_paesi"
                                                        id="anagrafica_stato_origine" readonly>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-6">
                                                <div class="mb-3">
                                                    <label for="anagrafica_codice_fiscale" class="form-label">Codice
                                                        Fiscale</label>
                                                    <input type="text" class="form-control"
                                                        id="anagrafica_codice_fiscale" readonly>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <p>Sesso</p>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" id="anagrafica_sesso_M"
                                                        name="anagrafica_sesso" onclick="return false;">
                                                    <label class="form-check-label" for="anagrafica_sesso_M">M</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" id="anagrafica_sesso_F"
                                                        name="anagrafica_sesso" onclick="return false;">
                                                    <label class="form-check-label" for="anagrafica_sesso_F">F</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="mb-3">
                                                <label for="anagrafica_indirizzo_domicilio" class="form-label">Indirizzo
                                                    Domicilio</label>
                                                <input type="text" class="form-control"
                                                    id="anagrafica_indirizzo_domicilio" readonly>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="mb-3">
                                                <label for="anagrafica_indirizzo_residenza" class="form-label">Indirizzo
                                                    Residenza</label>
                                                <input type="text" class="form-control"
                                                    id="anagrafica_indirizzo_residenza" readonly>
                                            </div>
                                        </div>

                                    </form>

                                </div>
                            </div>
                        </div>
                        <div class="col-7">
                            <h2 class="mb-3">Curriculum vitae</h2>
                            <div class="card mb-3 bg-white">
                                <div class="card-body p-0">
                                    <div class="position-relative bg-dark rounded-1 w-100"
                                        style="min-height: 200px;">
                                        <object id="pdf_display_object" data="" type="application/pdf"
                                            class="rounded-1 shadow-sm w-100" style="height: 500px;">
                                            <div class="w-100 p-5" style="z-index: 1200;">
                                                <p class="text-light text-center">
                                                    Impossibile mostrare questa risorsa, puoi <a id="pdf_download_link"
                                                        href="" target="_blank">aprirla in un altra scheda</a>.
                                                </p>
                                            </div>
                                        </object>
                                        <div class="position-absolute bottom-0 end-0" style="z-index: 1600;">
                                            <div id="download_pdf_btn" class="bg-primary rounded shadow-sm p-2 m-2"
                                                style="cursor: pointer;">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                                    fill="#FFFFFF" class="bi bi-download" viewBox="0 0 16 16">
                                                    <path
                                                        d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5" />
                                                    <path
                                                        d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z" />
                                                </svg>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <h2 class="mb-3">Skills</h2>
                            <div class="card mb-3" id="skills_card" style="width: 100%;">
                                <div class="card-body">

                                    <div class="alert alert-info d-none" id="skills_info_text" role="alert">

                                    </div>

                                    <span id="template_skill_pill" class="d-none">
                                        <span
                                            class="badge rounded-pill text-bg-primary text-light p-2 m-2 d-flex justify-content-center align-items-center">
                                            <h5 class="m-0">&nbsp;{nome_skill}&nbsp;</h5>
                                        </span>
                                    </span>

                                    <span id="template_cetegoria_skills" class="d-none">
                                        <div class="row">
                                            <div class="mb-2 mt-3">
                                                <div class="row">
                                                    <div class="col-11">
                                                        <h4>{nome_categoria}</h4>
                                                    </div>
                                                    <div class="col-1">
                                                    </div>
                                                </div>
                                                <hr>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="d-flex flex-wrap">
                                                {skills_pills}
                                            </div>
                                        </div>
                                    </span>

                                    <span id="skills_list">

                                    </span>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row mb-3">
                    <h2 class="mb-3">Istruzione</h2>
                    <div class="card bg-white" id="istruzione_card">
                        <div class="card-body">

                            <div class="alert alert-info d-none" id="istruzione_info_text" role="alert">

                            </div>

                            <span class="d-none" id="istruzione_accordion_example_item">
                                <!-- <div class="accordion-item">
                                    <h2 class="accordion-header">
                                        <button class="accordion-button collapsed" type="button"
                                            data-bs-toggle="collapse"
                                            data-bs-target="#istruzione_accordion_collapse_{id_istruzione}"
                                            aria-expanded="true"
                                            aria-controls="istruzione_accordion_collapse_{id_istruzione}">
                                            "{titolo_di_studio}" presso: {nome_istituto}
                                        </button>
                                    </h2>
                                    <div id="istruzione_accordion_collapse_{id_istruzione}"
                                        class="accordion-collapse collapse collapsed"
                                        data-bs-parent="#istruzione_accordion">
                                        <div class="accordion-body">
                                            <h3>
                                                {nome_istituto}
                                            </h3>
                                            <h5>
                                                {indirizzo_istituto}
                                            </h5>
                                            <h6>
                                                Da {data_inizio} a {data_fine}
                                            </h6><br>
                                            <h2><span class="badge bg-primary">{voto}</span></h2>
                                            <br><br>
                                        </div>
                                    </div>
                                </div> -->
                            </span>

                            <div class="accordion mb-3" id="istruzione_accordion">
                            </div>  

                        </div>
                    </div>
                </div>
                <div class="row mb-3">
                    <h2 class="mb-3">Esperienza</h2>
                    <div class="card bg-white" id="esperienza_card">
                        <div class="card-body">

                            <div class="alert alert-info d-none" id="esperienza_info_text" role="alert">

                            </div>

                            <span class="d-none" id="esperienza_accordion_example_item">
                                <!-- <div class="accordion-item">
                                    <h2 class="accordion-header">
                                        <button class="accordion-button collapsed" type="button"
                                            data-bs-toggle="collapse"
                                            data-bs-target="#esperienza_accordion_collapse_{id_esperienza}"
                                            aria-expanded="true"
                                            aria-controls="esperienza_accordion_collapse_{id_esperienza}">
                                            "{posizione}" presso: {nome_azienda}
                                        </button>
                                    </h2>
                                    <div id="esperienza_accordion_collapse_{id_esperienza}"
                                        class="accordion-collapse collapse" data-bs-parent="#esperienza_accordion">
                                        <div class="accordion-body">
                                            <h3>
                                                {posizione}
                                            </h3>
                                            <h5>
                                                {indirizzo_azienda}
                                            </h5>
                                            <h6>
                                                Da {data_inizio} a {data_fine}
                                            </h6><br>
                                            <p>
                                                {funzione}
                                            </p>
                                            <br><br>
                                        </div>
                                    </div>
                                </div> -->
                            </span>

                            <div class="accordion mb-3" id="esperienza_accordion">
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            </div>
        </section>


        <jsp:include page='../view-common/footer.jsp'></jsp:include>

        <script type="text/javascript">
            let anagraficaWidgetFullName = document.querySelector('#anagrafica_full_name');

            let dataUser = JSON.parse(`<%=request.getAttribute("dataUser")%>`);

            console.log(dataUser);

            anagraficaWidgetFullName.innerHTML = dataUser.nome + " " + dataUser.cognome;
        </script>

        <jsp:include page='scripts/profile_anagrafica.jsp'></jsp:include>
        <jsp:include page='scripts/profile_skills.jsp'></jsp:include>
        <jsp:include page='scripts/profile_istruzione.jsp'></jsp:include>
        <jsp:include page='scripts/profile_esperienza.jsp'></jsp:include>
        <jsp:include page='scripts/profile_pdf.jsp'></jsp:include>
        <jsp:include page='scripts/profile_image.jsp'></jsp:include>

    </body>

    </html>