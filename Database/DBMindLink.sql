
/*Drop database dbMindLink1
go
*/
Create database dbMindLink1
go

Use dbMindLink1
go

Create table TbArticulos(
IDArticulo int identity(1,1) primary key,
Titulo varchar(70) not null,
Descripcion varchar(400),
Imagen image,
Fecha date,
IDEmpleado int
);
Create table TbAnuncio(
IDAnuncio int identity(1,1) primary key,
Titulo nvarchar(70),
Descripcion varchar(400),
Imagen image,
Fecha date,
IDEmpleado int,
IDAdministrador int
);
Create table TbIncapacidades(
IDIncapacidad int identity(1,1) primary key,
Fecha date,
Mensaje varchar(1000),
IDEmpleado int,
IDAdministrador int
);
Create table TbEstadisticas(
IDEstadistica int identity(1,1) primary key,
IDCita int,
IDClinica int
);
Create table TbPruebas(
IDPrueba int identity(1,1) primary key,
Titulo nvarchar(100)not null,
Descripcion varchar(800),
Precio money not null,
IDEmpleado int,
IDAdministrador int
);
Create table TbRespuestas(
IDRespuesta int identity(1,1) primary key,
IDOpcion int,
IDPregunta int
);
Create table TbPreguntas(
IDPregunta int identity(1,1) primary key,
Pregunta varchar(300) not null,
IDPrueba int
);
Create table TbOpciones(
IDOpcion int identity(1,1) primary key,
Opcion varchar(30),
ValorOpcion int,
IDPregunta int
);
Create table TbLlaves(
IDLlave int identity(1,1) primary key,
Llave nvarchar(10) unique,
Fecha Date,
IDPrueba int
);
Create table TbResultados(
IDResultados int identity(1,1) primary key,
Resultados varchar(400),
IDPrueba int
);
Create table TbCitas(
IDCitas int identity(1,1) primary key,
Fecha date not null,
IDEmpleado int,
IDPaciente int
);
Create table TbClinicas(
IDClinica int identity(1,1) primary key,
NombreClinica varchar(300)Not null,
Ubicacion Varchar(1000), 
Dueño nvarchar(100),
Descripcion varchar(400),
Logo image
);
Create table TbUsuarios(
IDUsuario int identity(1,1) primary key,
UserName varchar(50) unique,
Contraseña varbinary(max),
FotoPerfil image,
IDContacto int
);
Create table TbContactos(
IDContacto int identity(1,1) primary key,
Correo varchar(300) unique,
NumTelefonico nvarchar(14)
);
Create table TbGenero(
IDGenero int identity(1,1) primary key,
Genero int
);
Create table TbActividadesLaborales(
IDActividadLaboral int identity(1,1) primary key,
NombreDeActividad varchar(50)
);
Create Table TbEmpleados(
IDEmpleado int identity(1,1) primary key,
Nombre varchar(90),
Apellido varchar(90),
Salario varbinary(max),
FNacimiento date,
DUI varchar(20) unique,
IDTipoUsuario int,
IDActividadLaboral int,
IDGenero int,
IDClinica int,
IDUsuario int
);
Create Table TbAdministrador(
IDAdministrador int identity(1,1) primary key,
Nombre varchar(90),
Apellido varchar(90),
FNacimiento date,
DUI varchar(20) unique,
IDTipoUsuario int,
IDGenero int,
IDClinica int,
IDUsuario int
);

Create Table TbPacientes(
IDPaciente int identity(1,1) primary key,
Nombre varchar(90),
Apellido varchar(90),
FNacimiento date,
DUI varchar(20) unique,
IDTipoUsuario int,
IDGenero int,
IDClinica int,
IDUsuario int
);
Create Table TbTipoUsuarios(
IDTipoUsuario int identity(1,1) primary key,
Cargo varchar(60),
);
Create Table TbAgendasPersonales(
IDAgendaPersonal int identity(1,1) primary key,
Contenido varchar(max),
Fecha date,
IDPaciente int
);
Create Table TbExpedientes(
IDExpediente int identity(1,1) primary key,
Contenido varchar(max),
Fecha date,
IDPaciente int,
IDEmpleado int
);
Create Table TbComentarios(
IDComentario int identity(1,1) primary key,
Mensaje varchar(1000),
Fecha date,
IDPaciente int
);
Create Table TbRecetasMedicas(
IDReceta int identity(1,1) primary key,
Fecha date,
Descripcion varchar(900),
IDPaciente int,
IDClinica int,
IDMedicamento int
);
Create table TbMedicamentos(
IDMedicamento int identity(1,1) primary key,
NombreMedicamento varchar(500)
);

Insert into TbMedicamentos values ('Penedol')
Select * from TbMedicamentos

Alter table TbArticulos Add constraint fk_IDEmpleado_TBArt
Foreign key (IDEmpleado) References TbEmpleados(IDEmpleado);

Alter table TbAnuncio Add constraint fk_IDEmpleado_TbAnun
Foreign key (IDEmpleado) References tbEmpleados(IDEmpleado);
/*
Hasta aquí va bien (ya lo probe)
*/
Alter table TbAnuncio Add constraint fk_IDAdministrador_TbAnun
Foreign key (IDAdministrador) References TbAdministrador(IDAdministrador);

Alter table TbIncapacidades Add constraint fk_IDEmpleado_TbIncap
Foreign key (IDEmpleado) References TbEmpleados(IDEmpleado);

Alter table TbIncapacidades Add constraint fk_IDAdministrador_TbIncap
Foreign key (IDAdministrador) References TbAdministrador(IDAdministrador);

Alter table TbEstadisticas Add constraint fk_IDCita_TbEstad
Foreign key (IDCita) References TbCitas(IDCitas);

Alter table TbEstadisticas Add constraint fk_IDClinica_TbClin
Foreign key (IDClinica) References TbClinicas(IDClinica);

Alter table TbPruebas Add constraint fk_IDEmpleado_TbPrue
Foreign key (IDEmpleado) References TbEmpleados(IDEmpleado);

Alter table TbPruebas Add constraint fk_IDAdministrador_TbPrue
Foreign key (IDAdministrador) References TbAdministrador(IDAdministrador);

Alter table TbRespuestas Add constraint fk_IDOpcion_TbResp
Foreign key (IDOpcion) References TbOpciones(IDOpcion);

Alter table TbRespuestas Add constraint fk_IDPregunta_TbResp
Foreign key (IDPregunta) References TbPreguntas(IDPregunta);

Alter table TbPreguntas Add constraint fk_IDPregunta_TbPreg
Foreign key (IDPrueba) References TbPruebas(IDPrueba);

Alter table TbOpciones Add constraint fk_IDPregunta_TbOpci
Foreign key (IDPregunta) References TbPreguntas(IDPregunta);

Alter table TbLlaves Add constraint fk_IDPrueba_TBLlav
Foreign key (IDPrueba) References TbPruebas(IDPrueba);
/*
Hasta aquí good
*/
Alter table TbResultados Add constraint fk_IDPrueba_TbResul
Foreign key (IDPrueba) References TbPruebas(IDPrueba);

Alter table TbCitas Add constraint fk_IDEmpleado_TbCit
Foreign key (IDEmpleado) References TbEmpleados(IDEmpleado);

Alter table TbCitas Add constraint fk_IDPaciente_TbCit
Foreign key (IDPaciente) References TbPacientes(IDPaciente);

Alter table TbUsuarios Add constraint fk_IDContacto_TbUsuar
Foreign key (IDContacto) References TbContactos(IDContacto);
/*
Hasta aqui good
*/
Alter table TbEmpleados Add constraint fk_IDTipoUsuario_TbEmple
Foreign key (IDTipoUsuario) References TbTipoUsuarios(IDTipoUsuario);

Alter table TbEmpleados Add constraint fk_IDActividadLaboral_TbEmple
Foreign key (IDActividadLaboral) References TbActividadesLaborales(IDActividadLaboral);

Alter table TbEmpleados Add constraint fk_IDGenero_TbEmple
Foreign key (IDGenero) References TbGenero(IDGenero);

Alter table TbEmpleados Add constraint fk_IDClinica_TbEmple
Foreign key (IDClinica) References TbClinicas(IDClinica);

Alter table TbEmpleados Add constraint fk_IDUsuario_TbEmple
Foreign key (IDUsuario) References TbUsuarios(IDUsuario);

Alter table TbAdministrador Add constraint fk_IDTipoUsuario_TbAdmin
Foreign key (IDTipoUsuario) References TbTipoUsuarios(IDTipoUsuario);

Alter table TbAdministrador Add constraint fk_IDGenero_TbAdmin
Foreign key (IDGenero) References TbGenero(IDGenero);

Alter table TbAdministrador Add constraint fk_IDClinica_TbAdmin
Foreign key (IDClinica) References TbClinicas(IDClinica);

Alter table TbAdministrador Add constraint fk_IDUsuario_TbAdmin
Foreign key (IDUsuario) References TbUsuarios(IDUsuario);

Alter table TbPacientes Add constraint fk_IDTipoUsuario_TbPacie
Foreign key (IDTipoUsuario) References TbTipoUsuarios(IDTipoUsuario);

Alter table TbPacientes Add constraint fk_IDGenero_TbPacie
Foreign key (IDGenero) References TbGenero(IDGenero);

Alter table TbPacientes Add constraint fk_IDClinica_TbPacie
Foreign key (IDClinica) References TbClinicas(IDClinica);

Alter table TbPacientes Add constraint fk_IDUsuario_TbPacie
Foreign key (IDUsuario) References TbUsuarios(IDUsuario);

Alter table TbAgendasPersonales Add constraint fk_IDPaciente_TbAgen
Foreign key (IDPaciente) References TbPacientes(IDPaciente);

Alter table TbExpedientes Add constraint fk_IDPaciente_TbExpe
Foreign key (IDPaciente) References TbPacientes(IDPaciente);

Alter table TbExpedientes Add constraint fk_IDEmpleado_TbExpe
Foreign key (IDEmpleado) References TbEmpleados(IDEmpleado);

Alter table TbComentarios Add constraint fk_IDPaciente_TBComen
Foreign key (IDPaciente) References TbPacientes(IDPaciente);

Alter table TbRecetasMedicas Add constraint fk_IDPaciente_TBRecet
Foreign key (IDPaciente) References TbPacientes(IDPaciente);

Alter table TbRecetasMedicas Add constraint fk_IDClinica_TbRecet
Foreign key (IDClinica) References TbClinicas(IDClinica);

Alter table TbRecetasMedicas Add constraint fk_IDMedicamentos_Medica
Foreign key (IDMedicamento) References TbMedicamentos(IDMedicamento);
/*
Ya esta bien aaaa
*/

