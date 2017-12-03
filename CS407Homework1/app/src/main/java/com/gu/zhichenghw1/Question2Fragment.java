package com.gu.zhichenghw1;

import android.app.Fragment;
import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import java.util.HashSet;
import java.util.Set;

public class Question2Fragment extends Fragment {

    private OnFragmentInteractionListener mListener;

    private EditText answerText;

    private Set<String> correctAnswer;

    public Question2Fragment() {
    }

    public static Question2Fragment newInstance() {
        return new Question2Fragment();
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        correctAnswer = new HashSet<>();
        correctAnswer.add("1.5");
        correctAnswer.add("3/2");
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_question2, container, false);

        Button preiousButton = (Button) view.findViewById(R.id.previousButton);
        Button nextButton = (Button) view.findViewById(R.id.nextButton);
        answerText = (EditText) view.findViewById(R.id.editText);

        nextButton.setOnClickListener(new onNextListener());
        preiousButton.setOnClickListener(new onPreviousListener());

        return view;
    }

    @Override
    public void onAttach(Context context) {
        super.onAttach(context);
        if (context instanceof OnFragmentInteractionListener) {
            mListener = (OnFragmentInteractionListener) context;
        } else {
            throw new RuntimeException(context.toString()
                    + " must implement OnFragmentInteractionListener");
        }
    }

    @Override
    public void onDetach() {
        super.onDetach();
        mListener = null;
    }

    public interface OnFragmentInteractionListener {
        void onFragmentInteraction(Fragment fragment, int operation, boolean isRight);
    }

    class onNextListener implements View.OnClickListener {

        @Override
        public void onClick(View view) {
            String answer = answerText.getText().toString();

            answer = answer.replaceAll(" ", "");

            if(answer.isEmpty()) {
                Toast.makeText(getActivity(), "Please enter your answer!", Toast.LENGTH_SHORT).show();

            } else {
                mListener.onFragmentInteraction(Question2Fragment.this, Constants.NEXT,
                        correctAnswer.contains(answer));

            }
        }
    }

    class onPreviousListener implements View.OnClickListener {

        @Override
        public void onClick(View view) {
            mListener.onFragmentInteraction(Question2Fragment.this, Constants.PREVIOUS, true);
        }
    }
}
