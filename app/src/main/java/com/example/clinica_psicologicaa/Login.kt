package com.example.clinica_psicologicaa

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.ImageButton
import android.widget.TextView
import androidx.appcompat.app.AlertDialog
import java.sql.Connection
import java.sql.DriverManager
import java.sql.SQLException

class Login : AppCompatActivity() {

    private var conexionSQL = ConexionSQL()
    private lateinit var Username: EditText
    private lateinit var Password: EditText
    private lateinit var btnIniciarSesion: Button

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_login)

        val btnTextRegister = findViewById<TextView>(R.id.btnRegistrar)

        btnTextRegister.setOnClickListener {
            val intent: Intent = Intent(this, Registrarse::class.java)
            startActivity(intent)
        }

        val btnTextRecordar = findViewById<TextView>(R.id.btnRecordarPassword)

        btnTextRecordar.setOnClickListener {
            val intent: Intent = Intent(this, RecordarPassword::class.java)
            startActivity(intent)

        }

        val btnIniciarSesion = findViewById<ImageButton>(R.id.btnIniciarSesion)

        btnIniciarSesion.setOnClickListener {
            val intent: Intent = Intent(this,PInicial ::class.java)
            startActivity(intent)

        }

        /*
                    Username = findViewById(R.id.Usuario)
                    Password = findViewById(R.id.Contraseña)
                    btnIniciarSesion = findViewById(R.id.btnIniciarSesion)

                    btnIniciarSesion.setOnClickListener {
                        val username = Username.text.toString()
                        val password = Password.text.toString()

                        if (validateLogin(username, password)) {
                            // Inicio de sesión exitoso, redirigir a la siguiente actividad
                            val intent = Intent(this, LoginInicio::class.java)
                            startActivity(intent)
                            finish()
                        } else {
                            // Mostrar cuadro de diálogo con mensaje de error
                            val dialogBuilder = AlertDialog.Builder(this)
                            dialogBuilder.setMessage("Datos ingresados incorrectos.")
                                .setCancelable(false)
                                .setPositiveButton("Aceptar") { dialog, _ ->
                                    dialog.dismiss()
                                }

                            val alert = dialogBuilder.create()
                            alert.setTitle("Error")
                            alert.show()
                        }
                    }
            }

            private fun validateLogin(username: String, password: String): Boolean {
                var connection: Connection? = null

                val serverName = "192.168.0.9:50535"
                val dbName = "dbMindLink"
                val username = "sa"
                val password = "user1"

                try {
                    // Establecer la conexión a la base de datos SQL Server
                    Class.forName("net.sourceforge.jtds.jdbc.Driver")
                    val url = "jdbc:jtds:sqlserver://$serverName/$dbName"
                    connection = DriverManager.getConnection(url, username, password)

                    // Realizar la consulta para validar los datos de inicio de sesión
                    val query = conexionSQL.dbConn()?.prepareStatement("EXEC PDLogear(?,?")!!
                    query.setString(1, txtUsuario.text.toString())
                    query.setString(2, txtContraseña.text.toString())
                    query.executeQuery()


                } catch (e: SQLException) {
                    e.printStackTrace()
                } finally {
                    // Cerrar la conexión
                    try {
                        connection?.close()
                    } catch (e: SQLException) {
                        e.printStackTrace()
                    }
                }

                return false // En caso de cualquier error o si no se encontraron registros

                 //no estoy seguro de esto


            */

    }
}