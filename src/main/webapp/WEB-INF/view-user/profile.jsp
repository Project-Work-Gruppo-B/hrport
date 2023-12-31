<%@ page contentType="text/html;charset=UTF-8" session="false" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profilo | TalentBridge</title>
        <link href="<%=request.getContextPath()%>/resources/css/custom/custom.css" rel="stylesheet">
        <script type="text/javascript"
            src="<%=request.getContextPath()%>/resources/js/bootstrap.bundle.min.js"></script>
    </head>

    <body class="bg-body-tertiary">

        <jsp:include page='../view-common/account_edit_modal.jsp'></jsp:include>


        <jsp:include page='../view-common/user_header.jsp'>
            <jsp:param name="activeLinkId" value="profilo" />
        </jsp:include>

        <section style="min-height: 100vh;">
            <div class="container-fluid p-4">
                <h1 class="mb-2">Profilo personale</h1>
                <hr>

                <div class="row">

                    <div class="row mb-3">

                        <div class="col-5">
                            <h2 class="mb-3">Anagrafica</h2>
                            <div class="card mb-3" style="width: 100%;">
                                <div class="card-body">

                                    <div class="mb-5">
                                        <div class="d-flex justify-content-center align-items-center flex-column">
                                            <div class="rounded shadow-sm mb-1 bg-dark" style="width: 150px; height: 150px; background-position: center center; background-size: cover; background-repeat: no-repeat;" id="anagrafica_propic">
                                            </div>
                                            <p class="fs-3" id="anagrafica_full_name"></p>
                                        </div>
                                    </div>

                                    <p class="text-end">
                                        <a href="#" id="anagrafica_abilita_modifica">Abilita Modifica</a>
                                    </p>

                                    <form id="anagrafica_form">

                                        <div class="alert alert-info d-none" id="anagrafica_info_text" role="alert">

                                        </div>

                                        <div class="alert alert-success d-none" id="anagrafica_success_text"
                                            role="alert">

                                        </div>
                                        <div class="alert alert-danger d-none" id="anagrafica_error_text" role="alert">

                                        </div>

                                        <div class="row">
                                            <div class="col-6">
                                                <div class="mb-3">
                                                    <label for="anagrafica_data_nascita" class="form-label">Data di
                                                        nascita</label>
                                                    <input type="date" class="form-control" id="anagrafica_data_nascita"
                                                        disabled required>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="mb-3">
                                                    <label for="anagrafica_provincia_nascita"
                                                        class="form-label">Provincia
                                                        di nascita</label>
                                                    <input type="text" class="form-control"
                                                        id="anagrafica_provincia_nascita" list="lista_province" disabled
                                                        required>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-6">
                                                <div class="mb-3">
                                                    <label for="anagrafica_numero_telefono" class="form-label">Numero di
                                                        telefono</label>
                                                    <input type="tel" class="form-control" maxlength="10" minlength="9"
                                                        id="anagrafica_numero_telefono" disabled required>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="mb-3">
                                                    <label for="anagrafica_stato_origine" class="form-label">Stato di
                                                        origine</label>
                                                    <input type="tel" class="form-control" list="lista_paesi"
                                                        id="anagrafica_stato_origine" disabled required>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-6">
                                                <div class="mb-3">
                                                    <label for="anagrafica_codice_fiscale" class="form-label">Codice
                                                        Fiscale</label>
                                                    <input type="text" class="form-control" maxlength="16" minlength="16"
                                                        id="anagrafica_codice_fiscale" disabled required>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <p>Sesso</p>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" id="anagrafica_sesso_M"
                                                        name="anagrafica_sesso" disabled required>
                                                    <label class="form-check-label" for="anagrafica_sesso_M">M</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" id="anagrafica_sesso_F"
                                                        name="anagrafica_sesso" disabled required>
                                                    <label class="form-check-label" for="anagrafica_sesso_F">F</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="mb-3">
                                                <label for="anagrafica_indirizzo_domicilio" class="form-label">Indirizzo
                                                    Domicilio</label>
                                                <input type="text" class="form-control"
                                                    id="anagrafica_indirizzo_domicilio" disabled required>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="mb-3">
                                                <label for="anagrafica_indirizzo_residenza" class="form-label">Indirizzo
                                                    Residenza</label>
                                                <input type="text" class="form-control"
                                                    id="anagrafica_indirizzo_residenza" disabled required>
                                            </div>
                                        </div>

                                    </form>

                                    <div class="row mt-3 d-flex d-flex flex-row-reverse">
                                        <div class="col-2">
                                            <button type="button" id="anagrafica_salva_btn"
                                                class="btn btn-primary text-light w-100" disabled>
                                                <h5 class="m-0">Salva</h5>
                                            </button>
                                        </div>
                                    </div>

                                    <hr>

                                    <label for="anagrafica_foto_upload" class="form-label">Carica foto personale</label>
                                    <div class="row">
                                        <div class="col-10">
                                            <div class="mb-3">
                                                <input type="file" accept=".png,.jgp,.jpeg" class="form-control" id="anagrafica_foto_upload">
                                            </div>
                                        </div>
                                        <div class="col-2">
                                            <button type="button" id="image_upload_profile"
                                                class="btn btn-primary text-light w-100">
                                                <h5 class="m-0">Carica</h5>
                                            </button>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-7">
                            <h2 class="mb-3">Curriculum vitae</h2>
                            <div class="card mb-3 bg-white">
                                <div class="card-body p-0">
                                    <div class="position-relative bg-dark rounded-top-1 w-100"
                                        style="min-height: 200px;">
                                        <object id="pdf_display_object" data=""
                                            type="application/pdf" class="rounded-top-1 shadow-sm w-100"
                                            style="height: 500px;">
                                            <div class="w-100 p-5" style="z-index: 1200;">
                                                <p class="text-light text-center">
                                                    Impossibile mostrare questa risorsa, puoi <a id="pdf_download_link"
                                                        href=""
                                                        target="_blank">aprirla in un altra scheda</a>.
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
                                    <div class="p-4">
                                        <label for="curriculum_upload" class="form-label">Carica nuovo
                                            curriculum</label>
                                        <div class="row">
                                            <div class="col-10">
                                                <div class="mb-3">
                                                    <input type="file" accept=".pdf" class="form-control" id="curriculum_upload">
                                                </div>
                                            </div>
                                            <div class="col-2">
                                                <button type="button" id="pdf_upload_curriculum"
                                                    class="btn btn-primary text-light w-100">
                                                    <h5 class="m-0">Carica</h5>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="modal fade" id="skills_aggiungi_categoria_modal" tabindex="-1"
                                aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered modal-lg">
                                    <div class="modal-content border border-2 border-primary">
                                        <div class="modal-header bg-body-tertiary">
                                            <h1 class="modal-title fs-5">Aggiungi Categoria</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="mb-3">
                                                    <div class="alert alert-danger d-none"
                                                        id="skills_aggiungi_categoria_modal_error_text" role="alert">
                                                    </div>
                                                    <label for="skills_aggiungi_categoria_modal_nome"
                                                        class="form-label">Nome Categoria</label>
                                                    <input type="text" class="form-control"
                                                        id="skills_aggiungi_categoria_modal_nome">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="mb-3">
                                                    <p>
                                                        Aggiungi le skill per questa categoria.
                                                    </p>
                                                    <textarea type="text" class="form-control"
                                                        id="skills_aggiungi_categoria_modal_skills" rows="6"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" id="skills_aggiungi_categoria_modal_aggiungi_btn"
                                                class="btn btn-primary text-light">
                                                <h5 class="m-0">Aggiungi</h5>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="modal fade" id="skills_aggiungi_skill_modal" tabindex="-1" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content border border-2 border-primary">
                                        <div class="modal-header bg-body-tertiary">
                                            <h1 class="modal-title fs-5">Aggiungi Skill</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="mb-3">
                                                    <div class="alert alert-danger d-none"
                                                        id="skills_aggiungi_skill_modal_error_text" role="alert">
                                                    </div>
                                                    <label for="skills_aggiungi_skill_modal_nome"
                                                        class="form-label">Nome Skill</label>
                                                    <input type="text" class="form-control"
                                                        id="skills_aggiungi_skill_modal_nome">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" id="skills_aggiungi_skill_modal_aggiungi_btn"
                                                class="btn btn-primary text-light">
                                                <h5 class="m-0">Aggiungi</h5>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="modal fade" id="skills_gestisci_skill_modal" tabindex="-1" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content border border-2 border-primary">
                                        <div class="modal-header bg-body-tertiary">
                                            <h1 class="modal-title fs-5">Modifica Skill</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="mb-3">
                                                    <div class="alert alert-danger d-none"
                                                        id="skills_gestisci_skill_modal_error_text" role="alert">
                                                    </div>
                                                    <label for="skills_gestisci_skill_modal_nome"
                                                        class="form-label">Nome Skill</label>
                                                    <input type="text" class="form-control"
                                                        id="skills_gestisci_skill_modal_nome">

                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" id="skills_gestisci_skill_modal_elimina_btn"
                                                class="btn btn-danger text-light">
                                                <h5 class="m-0">Elimina Categoria</h5>
                                            </button>
                                            <button type="button" id="skills_gestisci_skill_modal_salva_btn"
                                                class="btn btn-primary text-light">
                                                <h5 class="m-0">Salva</h5>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="modal fade" id="skills_gestisci_categoria_modal" tabindex="-1"
                                aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content border border-2 border-primary">
                                        <div class="modal-header bg-body-tertiary">
                                            <h1 class="modal-title fs-5">Modifica Categoria</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="mb-3">
                                                    <div class="alert alert-danger d-none"
                                                        id="skills_gestisci_categoria_modal_error_text" role="alert">
                                                    </div>
                                                    <label for="skills_gestisci_categoria_modal_nome"
                                                        class="form-label">Nome Categoria</label>
                                                    <input type="text" class="form-control"
                                                        id="skills_gestisci_categoria_modal_nome">

                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" id="skills_gestisci_categoria_modal_elimina_btn"
                                                class="btn btn-danger text-light">
                                                <h5 class="m-0">Elimina Categoria</h5>
                                            </button>
                                            <button type="button" id="skills_gestisci_categoria_modal_salva_btn"
                                                class="btn btn-primary text-light">
                                                <h5 class="m-0">Salva</h5>
                                            </button>
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
                                            <h5 class="m-0">{nome_skill}</h5>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                style="cursor: pointer;" fill="currentColor" class="bi bi-pencil m-1"
                                                viewBox="0 0 16 16" data-bs-toggle="modal"
                                                data-bs-target="#skills_gestisci_skill_modal" data-id-skill="{id_skill}"
                                                data-id-categoria="{id_categoria}" data-nome-skill="{nome_skill}">
                                                <path
                                                    d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z" />
                                            </svg>
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
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                            style="cursor: pointer;" fill="currentColor"
                                                            class="bi bi-pencil" viewBox="0 0 16 16"
                                                            data-bs-toggle="modal"
                                                            data-bs-target="#skills_gestisci_categoria_modal"
                                                            data-id-categoria="{id_categoria}"
                                                            data-nome-categoria="{nome_categoria}">
                                                            <path
                                                                d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z" />
                                                        </svg>
                                                    </div>
                                                </div>
                                                <hr>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="d-flex flex-wrap">
                                                {skills_pills}

                                                <span
                                                    class="badge rounded-pill text-bg-primary text-light p-2 m-2 d-flex justify-content-center align-items-center">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                        style="cursor: pointer;" fill="currentColor"
                                                        class="bi bi-plus-lg" data-bs-toggle="modal"
                                                        data-bs-target="#skills_aggiungi_skill_modal"
                                                        data-id-categoria="{id_categoria}" viewBox="0 0 16 16">
                                                        <path fill-rule="evenodd"
                                                            d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2" />
                                                    </svg>
                                                </span>
                                            </div>
                                        </div>
                                    </span>

                                    <span id="skills_list">

                                    </span>

                                    <div class="row">
                                        <div class="col-10"></div>
                                        <div class="col-2">
                                            <button type="button" class="btn btn-primary text-light w-100"
                                                id="skills_aggiungi_openmodal_btn"
                                                data-bs-toggle="modal"
                                                data-bs-target="#skills_aggiungi_categoria_modal">
                                                <h5 class="m-0">Aggiungi</h5>
                                            </button>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="istruzione_modifica_modal" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-lg">
                        <div class="modal-content border border-2 border-primary">
                            <div class="modal-header bg-body-tertiary">
                                <h1 class="modal-title fs-5" id="istruzione_modifica_modal_title">Istruzione</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="alert alert-danger d-none" id="istruzione_modifica_modal_error_text"
                                    role="alert">
                                </div>
                                <div class="row">
                                    <div class="mb-3">
                                        <label for="istruzione_modifica_modal_titolo_di_studio"
                                            class="form-label">Titolo di
                                            studio</label>
                                        <input type="text" class="form-control"
                                            id="istruzione_modifica_modal_titolo_di_studio">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="mb-3">
                                        <label for="istruzione_modifica_modal_nome_istituto" class="form-label">Nome
                                            istituto</label>
                                        <input type="text" class="form-control"
                                            id="istruzione_modifica_modal_nome_istituto">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="mb-3">
                                        <label for="istruzione_modifica_modal_indirizzo_istituto"
                                            class="form-label">Indirizzo istituto</label>
                                        <input type="text" class="form-control"
                                            id="istruzione_modifica_modal_indirizzo_istituto">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-6">
                                        <div class="mb-3">
                                            <label for="istruzione_modifica_modal_data_inizio" class="form-label">Data
                                                di inizio</label>
                                            <input type="date" class="form-control"
                                                id="istruzione_modifica_modal_data_inizio">
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="mb-3">
                                            <label for="istruzione_modifica_modal_data_fine" class="form-label">Data di
                                                fine</label>
                                            <input type="date" class="form-control"
                                                id="istruzione_modifica_modal_data_fine">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-6">
                                        <div class="mb-3">
                                            <label for="istruzione_modifica_modal_voto" class="form-label">Voto</label>
                                            <input type="number" class="form-control"
                                                id="istruzione_modifica_modal_voto">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" id="istruzione_modifica_modal_modifica_btn"
                                    class="btn btn-primary text-light d-none">
                                    <h5 class="m-0">Modifica</h5>
                                </button>
                                <button type="button" id="istruzione_modifica_modal_aggiungi_btn"
                                    class="btn btn-primary text-light d-none">
                                    <h5 class="m-0">Aggiungi</h5>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="istruzione_elimina_modal" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content border border-2 border-primary">
                            <div class="modal-header bg-body-tertiary">
                                <h1 class="modal-title fs-5">Elimina Istruzione</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <p>Sei veramente sicuro di voler eliminare: "<span
                                        id="istruzione_elimina_modal_titolo_di_studio"></span>"?</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" id="istruzione_elimina_modal_elimina_btn"
                                    class="btn btn-danger text-light">
                                    <h5 class="m-0">Elimina</h5>
                                </button>
                                <button type="button" data-bs-dismiss="modal" class="btn btn-primary text-light">
                                    <h5 class="m-0">Annulla</h5>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="esperienza_modifica_modal" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-lg">
                        <div class="modal-content border border-2 border-primary">
                            <div class="modal-header bg-body-tertiary">
                                <h1 class="modal-title fs-5" id="esperienza_modifica_modal_title">Esperienza</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="alert alert-danger d-none" id="esperienza_modifica_modal_error_text"
                                    role="alert">
                                </div>
                                <div class="row">
                                    <div class="mb-3">
                                        <label for="esperienza_modifica_modal_posizione"
                                            class="form-label">Posizione</label>
                                        <input type="text" class="form-control"
                                            id="esperienza_modifica_modal_posizione">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="mb-3">
                                        <label for="esperienza_modifica_modal_azienda"
                                            class="form-label">Azienda</label>
                                        <input type="text" class="form-control" id="esperienza_modifica_modal_azienda">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="mb-3">
                                        <label for="esperienza_modifica_modal_indirizzo_azienda"
                                            class="form-label">Indirizzo azienda</label>
                                        <input type="text" class="form-control"
                                            id="esperienza_modifica_modal_indirizzo_azienda">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-6">
                                        <div class="mb-3">
                                            <label for="esperienza_modifica_modal_data_inizio" class="form-label">Data
                                                di inizio</label>
                                            <input type="date" class="form-control"
                                                id="esperienza_modifica_modal_data_inizio">
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="mb-3">
                                            <label for="esperienza_modifica_modal_data_fine" class="form-label">Data di
                                                fine</label>
                                            <input type="date" class="form-control"
                                                id="esperienza_modifica_modal_data_fine">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="mb-3">
                                        <p>Funzione</p>
                                        <textarea id="esperienza_modifica_modal_funzione" class="w-100 mb-1 form-control" rows="10"></textarea>
                                        <p class="text-muted text-end w-100"><span
                                                id="esperienza_modifica_modal_funzione_charcounter">0</span>/500</p>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" id="esperienza_modifica_modal_modifica_btn"
                                    class="btn btn-primary text-light d-none">
                                    <h5 class="m-0">Modifica</h5>
                                </button>
                                <button type="button" id="esperienza_modifica_modal_aggiungi_btn"
                                    class="btn btn-primary text-light d-none">
                                    <h5 class="m-0">Aggiungi</h5>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="esperienza_elimina_modal" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content border border-2 border-primary">
                            <div class="modal-header bg-body-tertiary">
                                <h1 class="modal-title fs-5">Elimina Istruzione</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <p>Sei veramente sicuro di voler eliminare: "<span
                                        id="esperienza_elimina_modal_posizione"></span>"?</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" id="esperienza_elimina_modal_elimina_btn"
                                    class="btn btn-danger text-light">
                                    <h5 class="m-0">Elimina</h5>
                                </button>
                                <button type="button" data-bs-dismiss="modal" class="btn btn-primary text-light">
                                    <h5 class="m-0">Annulla</h5>
                                </button>
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
                                            <p>
                                                <a style="cursor: pointer;" data-bs-toggle="modal"
                                                    data-bs-target="#istruzione_modifica_modal" class="m-0 link-primary"
                                                    data-istruzione-id="{id_istruzione}">Modifica istruzione</a>
                                                    -
                                                <a style="cursor: pointer;" data-bs-toggle="modal"
                                                    data-bs-target="#istruzione_elimina_modal" class="m-0 link-danger"
                                                    data-istruzione-id="{id_istruzione}">Elimina istruzione</a>
                                            </p>
                                        </div>
                                    </div>
                                </div> -->
                            </span>

                            <div class="accordion mb-3" id="istruzione_accordion">
                            </div>

                            <div class="row">
                                <div class="col-10"></div>
                                <div class="col-2">
                                    <button type="button" class="btn btn-primary text-light w-100"
                                    id="istruzione_aggiungi_openmodal_btn"
                                        data-bs-toggle="modal" data-bs-target="#istruzione_modifica_modal">
                                        <h5 class="m-0">Aggiungi</h5>
                                    </button>
                                </div>
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
                                            <p>
                                                <a style="cursor: pointer;" data-bs-toggle="modal"
                                                    data-bs-target="#esperienza_modifica_modal" class="m-0 link-primary"
                                                    data-bs-toggle="modal" data-esperienza-id="{id_esperienza}">Modifica
                                                    esperienza</a>
                                                -
                                                <a style="cursor: pointer;" data-bs-toggle="modal"
                                                    data-bs-target="#esperienza_elimina_modal" class="m-0 link-danger"
                                                    data-bs-toggle="modal" data-esperienza-id="{id_esperienza}">Elimina
                                                    esperienza</a>
                                            </p>
                                        </div>
                                    </div>
                                </div> -->
                            </span>

                            <div class="accordion mb-3" id="esperienza_accordion">
                            </div>

                            <div class="row">
                                <div class="col-10"></div>
                                <div class="col-2">
                                    <button type="button" class="btn btn-primary text-light w-100"
                                    id="esperienza_aggiungi_openmodal_btn"
                                        data-bs-toggle="modal" data-bs-target="#esperienza_modifica_modal">
                                        <h5 class="m-0">Aggiungi</h5>
                                    </button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
            </div>
        </section>


        <jsp:include page='../view-common/footer.jsp'></jsp:include>

        <jsp:include page='data/lista_paesi.jsp'></jsp:include>
        <jsp:include page='data/lista_province.jsp'></jsp:include>

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