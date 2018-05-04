package com.example.a42876248.proyecto;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.Spinner;


public class BuscarLocales extends AppCompatActivity {

    Spinner TComida;
    ImageView Fondo;
    ImageView Logo;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_buscar_locales);
        Conexiones();

    }

    public void Conexiones ()
    {
        TComida=(Spinner) findViewById(R.id.sp01);
        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(this, R.array.TiposComida, android.R.layout.simple_spinner_item);
        TComida.setAdapter(adapter);
        Fondo=(ImageView) findViewById(R.id.imageView);
        Logo=(ImageView) findViewById(R.id.imageView2);
    }
}
