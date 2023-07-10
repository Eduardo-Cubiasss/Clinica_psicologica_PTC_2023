package com.example.clinica_psicologicaa

import android.annotation.SuppressLint
import android.content.Intent
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import java.sql.PreparedStatement
import java.util.Date


lateinit var txtNombre : EditText
lateinit var txtApellidos : EditText
lateinit var txtNacimiento : EditText
lateinit var txtIdClinica : EditText
lateinit var txtContraseña : EditText
lateinit var txtNumero : EditText
lateinit var txtUsuario : EditText

class Registrarse : AppCompatActivity() {

    private var conexionSQL = ConexionSQL()

    @SuppressLint("WrongViewCast")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_registrarse)

        val btnTextOiniciarsesion = findViewById<TextView>(R.id.btnOiniciarsesion)

        btnTextOiniciarsesion.setOnClickListener{
            val intent: Intent = Intent(this, Login::class.java)

            startActivity(intent)

            val Nombres = findViewById<EditText>(R.id.txtNombre)
            val Apellidos = findViewById<EditText>(R.id.txtApellidos)
            val FechaNacimiento = findViewById<EditText>(R.id.txtNacimiento)
            val IdClinica = findViewById<EditText>(R.id.txtIdClinica)
            val usuarios = findViewById<EditText>(R.id.txtUsuario)
            val password = findViewById<EditText>(R.id.txtContraseña)
            val Telefonos = findViewById<EditText>(R.id.txtNumero)

            val txtCrearCuenta = findViewById<Button>(R.id.btnCrearCuenta)

            txtCrearCuenta.setOnClickListener {
                val Nombres = txtNombre.text.toString()
                val Apellidos = txtApellidos.text.toString()
                val FechaNacimiento = txtNacimiento.text.toString()
                val IdClinica = txtIdClinica.text.toString()
                val usuarios = txtUsuario.text.toString()
                val password = txtContraseña.text.toString()
                val Telefonos = txtNumero.text.toString()

                val addPersona:PreparedStatement = conexionSQL.dbConn()?.prepareStatement("EXEC PDRegistrarpaciente(?,?,?,?,?,?,?)")!!
                addPersona.setString(1, Nombres)
                addPersona.setString(2, Apellidos)
                addPersona.setString(3, FechaNacimiento)
                addPersona.setString(4, IdClinica)
                addPersona.setString(5, usuarios)
                addPersona.setString(6, password)
                addPersona.setString(7, Telefonos)

                addPersona.executeUpdate()

            }

        }

    }

}