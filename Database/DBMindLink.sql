
/*
Drop database dbMindLink
go 

*/


Create database dbMindLink
go

Use dbMindLink
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
IDClinica varchar(5)
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
IDClinica Varchar(5) primary key,
NombreClinica varchar(300),
Ubicacion Varchar(1000), 
Due�o nvarchar(100),
Descripcion varchar(400),
Logo image
);
Create table TbUsuarios(
IDUsuario int identity(1,1) primary key,
UserName varchar(50) unique,
Contrase�a varbinary(64),
FotoPerfil image,
IDContacto int
);
Create table TbContactos(
IDContacto int identity(1,1) primary key,
Correo varchar(300),
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
IDClinica varchar(5),
IDUsuario int
);
Create Table TbAdministrador(
IDAdministrador int identity(1,1) primary key,
Nombre varchar(90),
Apellido varchar(90),
FNacimiento date,
DUI varchar(20),
IDTipoUsuario int,
IDGenero int,
IDClinica varchar(5),
IDUsuario int
);

Create Table TbPacientes(
IDPaciente int identity(1,1) primary key,
Nombre varchar(90),
Apellido varchar(90),
FNacimiento date,
DUI varchar(20),
IDTipoUsuario int,
IDGenero int,
IDClinica Varchar(5),
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
IDClinica Varchar(5),
IDMedicamento int
);
Create table TbMedicamentos(
IDMedicamento int identity(1,1) primary key,
NombreMedicamento varchar(500)
);


--Insert into TbAdministrador 
--Select * from TbMedicamentos

Alter table TbArticulos Add constraint fk_IDEmpleado_TBArt
Foreign key (IDEmpleado) References TbEmpleados(IDEmpleado);

Alter table TbAnuncio Add constraint fk_IDEmpleado_TbAnun
Foreign key (IDEmpleado) References tbEmpleados(IDEmpleado);
/*
Hasta aqu� va bien (ya lo probe)
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
Hasta aqu� good
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

/*
Desde aqu� comienzan los procesos almacenados
*/
CREATE PROCEDURE PDRegistrarAdmin
    @nombreTbA VARCHAR(90),
    @UsernameTbU VARCHAR(50),
    @Contrase�aTbU VARCHAR(90),
	@IdTbCli VARCHAR(5)
AS
BEGIN

    -- Insertar datos en la tabla TbClinicas si no existe
    IF NOT EXISTS (SELECT 1 FROM TbClinicas WHERE IDClinica = @IdTbCli)
    BEGIN
        INSERT INTO TbClinicas (IDClinica)
        VALUES (@IdTbCli)
    END

    -- Insertar datos en la tabla TbUsuarios si no existe
    IF NOT EXISTS (SELECT 1 FROM TbUsuarios WHERE UserName = @UsernameTbU)
    BEGIN
	-- Con esto declaramos la variable que contendra el Hash
		DECLARE @HashContrase�aTbU VARBINARY (64);
		SET @HashContrase�aTbU = HASHBYTES('SHA2_256', @Contrase�aTbU);
    -- Con las dos lineas de abajo mandamos a almacenar el Username y la contrase�a con Hash
		INSERT INTO TbUsuarios (Username, Contrase�a)
        VALUES (@UsernameTbU, @HashContrase�aTbU)
    END
	-- Obtener el IDUsuario basado en el Username
    DECLARE @IDUsuario INT
    SET @IDUsuario = (SELECT IDUsuario FROM TbUsuarios WHERE Username = @UsernameTbU)
	-- Insertar datos en la tabla TbAdministrador
    INSERT INTO TbAdministrador (Nombre, IDClinica, IDUsuario)
    VALUES (@nombreTbA, @IdTbCli, @IDUsuario)

END

EXEC PDRegistrarAdmin 'Antonio Perez', 'AntonioLiendra1', 'Contrase�a', '52281'
/* esto es para comprobar que el PDResgistrarAdmin funciona jejeje
Drop Procedure PDRegistrarAdmin

Delete TbUsuarios
Delete TbAdministrador
Delete TbClinicas
 
	esto es para reiniciar los PK en 0
DBCC CHECKIDENT ('TbUsuarios', RESEED, 0);
DBCC CHECKIDENT ('TbAdministrador', RESEED, 0);

Create table TbUsuarios(
IDUsuario int identity(1,1) primary key,
UserName varchar(50) unique,
Contrase�a varbinary(64),
FotoPerfil image,
IDContacto int
);
Select * from TbUsuarios
Select * from TbAdministrador
Select * from TbClinicas
*/

--Aqui empieza el proceso para logear todo tipo de usuario, admin, empleado, usuario

CREATE PROCEDURE PDLogear
    @UsernameIngresado VARCHAR(50),
    @ContraseñaIngresado NVARCHAR(90),
    @acceso BIT OUTPUT
AS
BEGIN
    DECLARE @IDUsuario INT;
    DECLARE @username VARCHAR(50);

    -- Agrega la declaraci�n de la variable @resultado aqui
    DECLARE @resultado BIT;

    SET @IDUsuario = (SELECT IDUsuario FROM TbUsuarios WHERE Username = @UsernameIngresado);
    SET @username = (SELECT UserName FROM TbUsuarios Where IDUsuario = @IDUsuario);

    IF(@username = @UsernameIngresado)
    BEGIN
        -- Con esto declaramos la variable que contendr� el Hash
        DECLARE @HashContraseñaTbU VARBINARY (64);
        DECLARE @Contraseñareal VARBINARY (64);

        SET @HashContraseñaTbU = HASHBYTES('SHA2_256', @ContraseñaIngresado);
        SET @Contraseñareal = (SELECT Contraseña FROM TbUsuarios WHERE IDUsuario = @IDUsuario);

        -- Con las l�neas de abajo, veremos si la contrase�a mandada ya hasheada coincide con la registrada
        IF (@HashContraseñaTbU = @Contrase�areal)
        BEGIN
            SET @resultado = 1;
        END
        ELSE
        BEGIN
            SET @resultado = 0;
        END
    END
    ELSE
    BEGIN
        SET @resultado = 0;
    END

    SET @acceso = @resultado;
END



DECLARE @resultado BIT;
EXEC PDLogear 'AntonioLiendra1', 'Contraseña', @resultado OUTPUT;
SELECT @resultado AS acceso;
PRINT @resultado;

---Aqui comienza otro proceso, este es para registrar pacientes
/*
Esto es namas para comprobar que funciona el proceso
DECLARE @resultado INT;


*/

--Esto borra el proceso jejejeje
--DROP Procedure PDLogear
---
--- Aqui empieza el proceso de registrar pacientes
CREATE PROCEDURE PDRegistrarpaciente
    @nombreTbP VARCHAR(90),
	@apellidoTbp VARCHAR(90),
	@fechadenaci DATE,
	@IdTbCli VARCHAR(5),
    @UsernameTbU VARCHAR(50),
    @Contrase�aTbU VARCHAR(90),
	@Numtel nvarchar(14)
AS
BEGIN
	DECLARE @clinica Varchar(5);
	SET @clinica = (SELECT IDClinica FROM TbClinicas WHERE IDClinica = @IdTbCli);
    -- Insertar datos en la tabla TbClinicas si existe
    IF (@clinica = @IdTbCli)
    BEGIN
         -- Insertar datos en la tabla TbUsuarios si no existe
		 IF NOT EXISTS (SELECT 1 FROM TbUsuarios WHERE UserName = @UsernameTbU)
			BEGIN
			-- Con esto declaramos la variable que contendra el Hash
			DECLARE @HashContrase�aTbU VARBINARY (64);
			SET @HashContraseñaTbU = HASHBYTES('SHA2_256', @ContraseñaTbU);
			INSERT INTO TbContactos (NumTelefonico)
			VALUES (@Numtel)
			DECLARE @Numerotel INT
			SET @Numerotel = (SELECT IDContacto FROM TbContactos WHERE @NumTel = @Numerotel)
			-- Con las dos lineas de abajo mandamos a almacenar el Username y la contrase�a con Hash
			INSERT INTO TbUsuarios (Username, Contrase�a, IDContacto)
			VALUES (@UsernameTbU, @HashContrase�aTbU, @Numerotel)
		END
	-- Obtener el IDUsuario basado en el Username
		DECLARE @IDUsuario INT
		SET @IDUsuario = (SELECT IDUsuario FROM TbUsuarios WHERE Username = @UsernameTbU)
	-- Insertar datos en la tabla TbAdministrador
		
		INSERT INTO TbPacientes (Nombre, Apellido, FNacimiento, IDClinica, IDUsuario)
		VALUES (@nombreTbP, @apellidoTbp,@fechadenaci,@IdTbCli, @IDUsuario)
		END
		
END


EXEC PDRegistrarpaciente 'Juan','CagaLindo','9-10-2001','52281','Juanes','contraseña', '+503 7689 6281';

Select * from TbContactos;
Select * from TbUsuarios;
Select * from TbClinicas;
Select * from TbPacientes;
DROP Procedure PDRegistrarpaciente
/*
Desde aqu� comienzan las vistas

*/