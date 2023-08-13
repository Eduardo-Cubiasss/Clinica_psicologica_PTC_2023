package com.example.clinica_psicologicaa

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.ImageView
import androidx.navigation.ui.AppBarConfiguration
import com.bumptech.glide.Glide

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        showGif()

        val appBarConfiguration = AppBarConfiguration(setOf(R.id.calendarioView,R.id.navigation_dashboard,R.id.navigation_home,R.id.navigation_notifications))

    }
    fun showGif(){
        val gifImageView = findViewById<ImageView>(R.id.splashscreen)
        Glide.with(this)
            .asGif()
            .load(R.drawable.splashscreem)
            .into(gifImageView)
    }
}
