package com.example.clinica_psicologicaa

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.text.Editable
import android.text.InputFilter
import android.text.Spanned
import android.text.TextWatcher
import android.util.Patterns
import android.widget.EditText
import java.util.regex.Pattern

class activity_acercademi : AppCompatActivity() {

    lateinit var txtDuiadm: EditText
    lateinit var txtNombreadm: EditText
    lateinit var txtApellidoadm: EditText
    lateinit var txtEdadadm: EditText
    lateinit var txtCorreoadm: EditText
    lateinit var txtTelfadm: EditText

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_acercademi)

        txtDuiadm = findViewById(R.id.txtDuiadm)
        txtNombreadm = findViewById(R.id.txtNombreadm)
        txtApellidoadm = findViewById(R.id.txtApellidoadm)
        txtEdadadm = findViewById(R.id.txtEdadadm)
        txtCorreoadm = findViewById(R.id.txtCorreoadm)
        txtTelfadm = findViewById(R.id.txtTelfadm)


            val digitsOnlyFilter = object : InputFilter {
                override fun filter(
                    source: CharSequence?,
                    start: Int,
                    end: Int,
                    dest: Spanned?,
                    dstart: Int,
                    dend: Int
                ): CharSequence? {
                    val builder = StringBuilder()
                    for (i in start until end) {
                        val c = source?.get(i)
                        if (Character.isDigit(c!!)) {
                            builder.append(c)
                        }

                    }
                    return builder.toString()
                }
            }

            txtDuiadm.filters = arrayOf(digitsOnlyFilter)

        txtDuiadm.setOnFocusChangeListener { _, hasFocus ->
            if (!hasFocus) {
                val duiValue = txtDuiadm.text.toString()
                if (!Pattern.matches("^\\d{8}-\\d$", duiValue)) {
                    txtDuiadm.error = "Ingrese un DUI válido (ej: 12345678-9)"

                    txtDuiadm.addTextChangedListener(object : TextWatcher {
                        override fun beforeTextChanged(s: CharSequence?, start: Int, count: Int, after: Int) {
                            // No necesitamos hacer nada antes de que el texto cambie
                        }

                        override fun onTextChanged(s: CharSequence?, start: Int, before: Int, count: Int) {
                            // No necesitamos hacer nada cuando el texto está cambiando
                        }

                        override fun afterTextChanged(s: Editable?) {
                            // Remover cualquier carácter diferente a dígitos o "-" al final del texto
                            val duiValue = s.toString()
                            if (!duiValue.matches("^\\d{9}(-\\d?)?$".toRegex())) {
                                if (duiValue.endsWith("-")) {
                                    // Remover múltiples ocurrencias de "-" al final del texto
                                    s?.delete(s.length - 2, s.length - 1)
                                } else {
                                    // Remover cualquier carácter diferente a dígitos o "-" al final del texto
                                    s?.delete(s.length - 1, s.length)
                                }
                            }
                        }
                    })
                }
            }
        }


    }
    }

