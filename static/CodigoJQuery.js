$(document).ready(function() {
	var nomina;
	var cursos;
	var arrayCursos;
	var proyectos;
	var arrayProyectos;
	var stringProyectos = "";
	var miCurso = "";
	var miProyecto = "";
	var stringEquipos = "";
	var equipoActual;
	var listaAlumnosGrupo;
	var arregloAlumnosGrupo;
	var claveProyecto;

	//presiona el boton de login
	$("#logInBtn").click( function(event) {
		//evita el login
		event.preventDefault();
		$(".cursosEnPanel").empty();
		//identifica al usuario
		$.get ("vista.php", { nom: $("#userId").val() , pass: $("#userPass").val() }, function(data) {

			//si encuentra la informacion
			if (data) {

				nomina = data; //guarda la nomina encontrada

				//envia los datos a donde es necesario
				$(".nombreEnPanel").empty().append(nomina); //nomina a panel
				$("#nombrePantalla").empty().append("Bienvenido " + nomina); //nomina a titulo

				//busca los cursos de la persona
				$.get ("cursosDocenteTabla.php", { id: $("#userId").val() } , function(data) {

					cursos = data;
					arrayCursos = cursos.split(",");

					//inserta los cursos
					for (var i = 0; i < arrayCursos.length; i++) {

						stringProyectos = "";
						$(".cursosEnPanel").append("<li>"+arrayCursos[i]+"</li>"); //el titulo del curso

						var cursoActual = arrayCursos[i];

						//recopila los proyectos del curso (almacenados como cadena)
						$.get ("llamarCursos.php", { claveCurso : arrayCursos[i] }, function(data) {
							proyectos = data;
							arrayProyectos = proyectos.split(",");
							//arma los proyectos del curso
							for (var j = 0; j < arrayProyectos.length; j++) {
								stringProyectos = stringProyectos + "<li><a href='#infoProyecto' name='"+cursoActual+
								"' class='objetoCursos'>"+arrayProyectos[j]+"</a></li>";
							} //for
							//inserta el curso
							$(".cursosEnPanel").append(stringProyectos);
							$(".cursosEnPanel").append("<li><a href='#nuevoProyecto' id='"+cursoActual+"' class='creaProyecto'>Nuevo Proyecto</a></li>").listview("refresh");

							//consigue los

						}); //get proyectos

					} //for

				}); //get cursos

				window.location = "#mainPage";

			}else
				alert("usuario o contraseña incorrecta");

		}); //get

	}); //click
	
	//boton de crear proyecto en pantalla de nuevo proyecto
	/*$("#btnCreaProyecto").click(function(event){
		//llama un get para crear el documento con los datos deseados

		$.get ("defineProyecto.php", { clavePrimaria : miCurso , nombreProyecto : $("#proyectName").val() ,
		fechaIn : $("#fechaInicio").val() , fechaEn : $("#fechaFin").val() , estructura : $("#estructuraProyecto").val() }, function(data) {
			alert(data);
		});
		window.location = "#mainPage";
	}); //click */

	//boton de crear proyecto en panel
	$( document ).on( "click", ".creaProyecto", function(event) {
		miCurso = $(this).attr("name");
		$("#nombreCursoModificado").append(miCurso);
	});

	//boton de ir a proyecto en panel
	$( document ).on( "click", ".objetoCursos", function(event) {
		miCurso = $(this).attr("name");
		miProyecto = $(this).text(); //codigo del proyecto actual
		$("#headerProyecto").empty().append("Swift - Proyecto " + miProyecto);
	});

	//boton hacia menu de equipos
	$( document ).on( "click", "#irEquipos", function(event) {
		$("#listaEquipos").empty();
		$.get ("recolectaEquipos.php", { claveProye: miProyecto }, function(data) {
			stringEquipos = data; //los equipos como cadena por comas
			misEquipos = stringEquipos.split(","); //los equipos en arreglo
			for (var i = 0; i < misEquipos.length; i++) {
				$("#listaEquipos").append("<li class='equipoProyecto'>"+
					"<a href='#nuevoIntegrante' class='ui-btn ui-shadow ui-icon-arrow-l ui-btn-icon-right'>"+misEquipos[i]+"</a></li>").listview("refresh");
			}
		});
	}); //on click

	//equipo en ventana de equipos
	$( document ).on( "click", ".equipoProyecto", function(event) {
		$("#nombreGrupo").empty().append($(this).text());
		$("#rellenoAlumnos").empty();
		//obtiene los alumnos en el curso
		$.get ("recolectaAlumnos.php", { claveEquipo: $(this).text() }, function(data) {
			listaAlumnos = data;
			var arregloAlumnos = listaAlumnos.split(",");
			for (var j = 0; j < arregloAlumnos.length; j++) {
				$("#rellenoAlumnos").append("<li class='equipoProyecto'>"+arregloAlumnos[j]+"</li>").listview("refresh");
			}
		}); //get alumnos de equipo
	});

	//boton de crear nuevo equipo
	$( document ).on( "click", "#creaEquipo", function(event) {
		$("#alumnosEnCurso").empty();
		//obtiene los alumnos del curso
		$.get ("recolectaAlumnosCurso.php", { claveCurso: miCurso }, function(data) {
			listaAlumnosGrupo = data;
			arregloAlumnosGrupo = listaAlumnosGrupo.split(",");
			for (var j = 0; j < arregloAlumnosGrupo.length; j++) {
				$("#alumnosEnCurso").append("<label for='"+arregloAlumnosGrupo[j]+"'><input type='checkbox' name='"+
					arregloAlumnosGrupo[j]+"' id='"+arregloAlumnosGrupo[j]+"'>"+arregloAlumnosGrupo[j]+"</label>");
			}
			$("#alumnosEnCurso").controlgroup("refresh");
		});
	});

	$( document ).on( "click", "#btnCreaGrupo", function(event) {
		var sNuevosAlumnos = $("#alumnosEnCurso").serialize(); //obtiene los alumnos en cadena
		var arregloNuevosAlumnos = sNuevosAlumnos.split("=on&");
		var cadenaAlumnos;
		for (var i = 0; i < arregloNuevosAlumnos.length; i++) {
			if(i == 0)
				cadenaAlumnos = arregloNuevosAlumnos[i] + ",";
			else
				cadenaAlumnos = cadenaAlumnos + arregloNuevosAlumnos[i] + ",";
		}
		cadenaAlumnos = cadenaAlumnos.substring(0,cadenaAlumnos.length-4);
		var claveNuevoEquipo = miProyecto+"-4";
		/*$.get ("insertaGrupo.php", { claveGrupo: claveNuevoEquipo, nomGrupo: "Equipo 4" , alumnos: cadenaAlumnos , documentoNombre: "Doc1" }, function(data) {
			alert(data);
		});*/
	});
	
});
