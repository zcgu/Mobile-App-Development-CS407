package com.gu.zhichenghw1;

import android.app.AlertDialog;
import android.app.Fragment;
import android.content.DialogInterface;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.ArrayMap;

import java.util.HashMap;
import java.util.Map;

public class QuizActivity extends AppCompatActivity implements
        Question1Fragment.OnFragmentInteractionListener, Question2Fragment.OnFragmentInteractionListener{

    private Map<Integer, Boolean> map;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_quiz);

        getSupportActionBar().setTitle("Question 1");

        map = new HashMap<>();

        getFragmentManager()
                .beginTransaction()
                .replace(R.id.fragment_container, Question1Fragment.newInstance())
                .addToBackStack(null)
                .commit();
    }

    @Override
    public void onFragmentInteraction(Fragment fragment, int operation, boolean isRight) {
        if(fragment instanceof Question1Fragment) {

            if(operation == Constants.PREVIOUS) question1Previous();
            else question1Next(isRight);

        } else if (fragment instanceof Question2Fragment) {

            if(operation == Constants.PREVIOUS) question2Previous();
            else question2Next(isRight);

        }
    }

    private void question1Previous() {
        finish();
    }

    private void question1Next(boolean isRight) {
        getSupportActionBar().setTitle("Question 2");

        map.put(1, isRight);

        getFragmentManager()
                .beginTransaction()
                .replace(R.id.fragment_container, Question2Fragment.newInstance())
                .addToBackStack(null)
                .commit();
    }

    private void question2Previous() {
        getSupportActionBar().setTitle("Question 1");

        getFragmentManager()
                .beginTransaction()
                .replace(R.id.fragment_container, Question1Fragment.newInstance())
                .addToBackStack(null)
                .commit();
    }

    private void question2Next(boolean isRight) {

        map.put(2, isRight);

        testFinish();
    }

    private void testFinish() {
        double correct = 0;

        for (boolean isRight : map.values()) if (isRight) correct++;

        double score = 100.0 * correct / map.size();

        new AlertDialog.Builder(this)
            .setTitle("Test Finish")
            .setMessage("Your score: " + (int) score + "!")
            .setPositiveButton("OK", new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialog, int which) {
                    finish();
                }
            })
            .setNegativeButton("Retake", new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialog, int which) {
                    recreate();
                }
            })
            .setIcon(android.R.drawable.ic_dialog_alert)
            .show();
    }
}
