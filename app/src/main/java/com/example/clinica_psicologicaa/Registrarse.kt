package com.example.clinica_psicologicaa

import android.annotation.SuppressLint
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import org.w3c.dom.Text
import java.sql.DriverManager
import java.sql.PreparedStatement

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

                val addPersona:PreparedStatement = conexionSQL.dbConn()?.prepareStatement("EXEC PDregistrarpacientes(?,?,?,?,?,?,?)")!!
                addPersona.setString(1, txtNombre.text.toString())
                addPersona.setString(2, txtApellidos.text.toString())
                addPersona.setString(3, txtNacimiento.text.toString())
                addPersona.setString(4, txtIdClinica.text.toString())
                addPersona.setString(5, txtContraseña.text.toString())
                addPersona.setString(7, txtNumero.text.toString())

                addPersona.executeUpdate()

            }

        }

    }

}