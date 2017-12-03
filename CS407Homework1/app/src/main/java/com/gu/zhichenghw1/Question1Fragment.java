package com.gu.zhichenghw1;

import android.app.Fragment;
import android.content.Context;
import android.os.Bundle;
import android.support.v4.content.ContextCompat;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.Toast;

public class Question1Fragment extends Fragment {

    private OnFragmentInteractionListener mListener;

    private final int correctAnswer = Constants.B;
    private int currentAnswer = Constants.unChoose;

    ImageView answer1, answer2, answer3, answer4;

    public Question1Fragment() {
    }

    public static Question1Fragment newInstance() {
        return new Question1Fragment();
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_question1, container, false);

        Button preiousButton = (Button) view.findViewById(R.id.previousButton);
        Button nextButton = (Button) view.findViewById(R.id.nextButton);
        answer1 = (ImageView) view.findViewById(R.id.answer1);
        answer2 = (ImageView) view.findViewById(R.id.answer2);
        answer3 = (ImageView) view.findViewById(R.id.answer3);
        answer4 = (ImageView) view.findViewById(R.id.answer4);

        answer1.setOnClickListener(new onAnswerSeclectListener(answer1, Constants.A));
        answer2.setOnClickListener(new onAnswerSeclectListener(answer2, Constants.B));
        answer3.setOnClickListener(new onAnswerSeclectListener(answer3, Constants.C));
        answer4.setOnClickListener(new onAnswerSeclectListener(answer4, Constants.D));

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

            if(currentAnswer == Constants.unChoose) {
                Toast.makeText(getActivity(), "Please select answer!", Toast.LENGTH_SHORT).show();

            } else {
                mListener.onFragmentInteraction(Question1Fragment.this, Constants.NEXT,
                        currentAnswer == correctAnswer);
            }
        }
    }

    class onPreviousListener implements View.OnClickListener {

        @Override
        public void onClick(View view) {
            mListener.onFragmentInteraction(Question1Fragment.this, Constants.PREVIOUS, true);
        }
    }

    class onAnswerSeclectListener implements View.OnClickListener {

        private ImageView answerView;
        private int answer;

        public onAnswerSeclectListener(ImageView answerView, int answer) {
            this.answerView = answerView;
            this.answer = answer;
        }

        @Override
        public void onClick(View view) {
            if(currentAnswer == Constants.unChoose) {

                currentAnswer = answer;
                answerView.setBackgroundColor(ContextCompat.getColor(getActivity(),
                        R.color.colorPrimary));

            } else if (currentAnswer == answer) {

                currentAnswer = Constants.unChoose;
                answerView.setBackgroundColor(ContextCompat.getColor(getActivity(), R.color.white));

            } else {

                currentAnswer = answer;
                answer1.setBackgroundColor(ContextCompat.getColor(getActivity(), R.color.white));
                answer2.setBackgroundColor(ContextCompat.getColor(getActivity(), R.color.white));
                answer3.setBackgroundColor(ContextCompat.getColor(getActivity(), R.color.white));
                answer4.setBackgroundColor(ContextCompat.getColor(getActivity(), R.color.white));
                answerView.setBackgroundColor(ContextCompat.getColor(getActivity(),
                        R.color.colorPrimary));

            }
        }
    }
}
